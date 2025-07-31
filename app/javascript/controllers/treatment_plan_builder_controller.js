import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["exerciseId", "sets", "reps", "instructions"]
  static values = { initial: Array }

  connect() {
    this.index = 0;
    this.existingIds = []; 
    this.deletedIds = [];  

    if (this.initialValue && this.initialValue.length > 0) {
      this.renderInitialExercises();
    }
  }

  renderInitialExercises() {
    const container = document.getElementById("exercise-list");
    container.innerHTML = "";

    this.initialValue.forEach((tpe) => {
      const exercise = tpe.exercise || {};
      if (tpe.id) this.existingIds.push(tpe.id);

      this.addExerciseToList({
        id: tpe.id,
        exerciseId: tpe.exercise_id,
        exerciseTitle: exercise.title || "Unknown",
        sets: tpe.sets,
        reps: tpe.reps,
        instructions: tpe.instructions
      });
    });
  }

  addExercise() {
    const exerciseId = this.exerciseIdTarget.value;
    const selectedOption = this.exerciseIdTarget.selectedOptions[0];
    const exerciseTitle = selectedOption?.dataset.title || selectedOption?.text || '';
    const sets = this.setsTarget.value;
    const reps = this.repsTarget.value;
    const instructions = this.instructionsTarget.value;

    if (!exerciseId || !sets || !reps) {
      alert("Please complete all fields before adding.");
      return;
    }

    this.addExerciseToList({ exerciseId, exerciseTitle, sets, reps, instructions });

    // Reset input fields
    this.exerciseIdTarget.value = "";
    this.setsTarget.value = "";
    this.repsTarget.value = "";
    this.instructionsTarget.value = "";
  }

  addExerciseToList({ id = null, exerciseId, exerciseTitle, sets, reps, instructions }) {
    const container = document.getElementById("exercise-list");
    const index = container.querySelectorAll("li").length;

    const li = document.createElement("li");

    // Use a consistent internal identifier to help with diffing
    if (id) {
      li.dataset.dbId = id;
    }

    li.innerHTML = `
      <strong>${exerciseTitle}</strong> — ${sets} sets x ${reps} reps
      <br><em>${instructions}</em>
      <button type="button" class="remove-button">🗑 Remove</button>

      ${id ? `<input type="hidden" name="treatment_plan[treatment_plan_exercises_attributes][${index}][id]" value="${id}">` : ""}
      <input type="hidden" name="treatment_plan[treatment_plan_exercises_attributes][${index}][exercise_id]" value="${exerciseId}">
      <input type="hidden" name="treatment_plan[treatment_plan_exercises_attributes][${index}][sets]" value="${sets}">
      <input type="hidden" name="treatment_plan[treatment_plan_exercises_attributes][${index}][reps]" value="${reps}">
      <input type="hidden" name="treatment_plan[treatment_plan_exercises_attributes][${index}][instructions]" value="${instructions}">
      <input type="hidden" name="treatment_plan[treatment_plan_exercises_attributes][${index}][_destroy]" value="false">
    `;

    // Handle delete behavior (track DB IDs to destroy)
    li.querySelector(".remove-button").addEventListener("click", () => {
      const removedId = li.dataset.dbId;
      li.remove();

      if (removedId) {
        const destroyContainer = document.getElementById("exercise-fields-container");
        const hidden = document.createElement("input");
        hidden.type = "hidden";
        hidden.name = `treatment_plan[treatment_plan_exercises_attributes][${this.index}][id]`;
        hidden.value = removedId;

        const destroy = document.createElement("input");
        destroy.type = "hidden";
        destroy.name = `treatment_plan[treatment_plan_exercises_attributes][${this.index}][_destroy]`;
        destroy.value = "true";

        destroyContainer.appendChild(hidden);
        destroyContainer.appendChild(destroy);
        this.index++;
      }
    });

    container.appendChild(li);
  }
}
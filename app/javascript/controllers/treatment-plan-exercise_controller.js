import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["list", "exerciseId", "sets", "reps", "instructions"]

  add(event) {
    event.preventDefault()

    const exerciseId = this.exerciseIdTarget.value
    const sets = this.setsTarget.value
    const reps = this.repsTarget.value
    const instructions = this.instructionsTarget.value

    if (!exerciseId || !sets || !reps) {
      alert("Please fill out all fields before adding to plan.")
      return
    }

    const selectedOption = this.exerciseIdTarget.options[this.exerciseIdTarget.selectedIndex]
    const exerciseTitle = selectedOption.text

    // Create hidden inputs for submission
    const html = `
      <div class="exercise-summary">
        <p><strong>${exerciseTitle}</strong> — ${sets} sets x ${reps} reps</p>
        <p><em>${instructions}</em></p>

        <input type="hidden" name="treatment_plan[treatment_plan_exercises_attributes][][exercise_id]" value="${exerciseId}">
        <input type="hidden" name="treatment_plan[treatment_plan_exercises_attributes][][sets]" value="${sets}">
        <input type="hidden" name="treatment_plan[treatment_plan_exercises_attributes][][reps]" value="${reps}">
        <input type="hidden" name="treatment_plan[treatment_plan_exercises_attributes][][instructions]" value="${instructions}">

        <button type="button" class="btn btn-danger" data-action="click->treatment-plan-exercise#remove">🗑 Remove</button>
      </div>
    `

    this.listTarget.insertAdjacentHTML("beforeend", html)

    // Clear input fields
    this.exerciseIdTarget.selectedIndex = 0
    this.setsTarget.value = ""
    this.repsTarget.value = ""
    this.instructionsTarget.value = ""
  }

  remove(event) {
    event.preventDefault()
    const button = event.target
    const container = button.closest(".exercise-summary")
    if (container) container.remove()
  }
}

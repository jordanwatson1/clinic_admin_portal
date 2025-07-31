require "application_system_test_case"

class TreatmentPlanExercisesTest < ApplicationSystemTestCase
  setup do
    @treatment_plan_exercise = treatment_plan_exercises(:one)
  end

  test "visiting the index" do
    visit treatment_plan_exercises_url
    assert_selector "h1", text: "Treatment plan exercises"
  end

  test "should create treatment plan exercise" do
    visit treatment_plan_exercises_url
    click_on "New treatment plan exercise"

    fill_in "Exercise", with: @treatment_plan_exercise.exercise_id
    fill_in "Instructions", with: @treatment_plan_exercise.instructions
    fill_in "Reps", with: @treatment_plan_exercise.reps
    fill_in "Sets", with: @treatment_plan_exercise.sets
    fill_in "Treatment plan", with: @treatment_plan_exercise.treatment_plan_id
    click_on "Create Treatment plan exercise"

    assert_text "Treatment plan exercise was successfully created"
    click_on "Back"
  end

  test "should update Treatment plan exercise" do
    visit treatment_plan_exercise_url(@treatment_plan_exercise)
    click_on "Edit this treatment plan exercise", match: :first

    fill_in "Exercise", with: @treatment_plan_exercise.exercise_id
    fill_in "Instructions", with: @treatment_plan_exercise.instructions
    fill_in "Reps", with: @treatment_plan_exercise.reps
    fill_in "Sets", with: @treatment_plan_exercise.sets
    fill_in "Treatment plan", with: @treatment_plan_exercise.treatment_plan_id
    click_on "Update Treatment plan exercise"

    assert_text "Treatment plan exercise was successfully updated"
    click_on "Back"
  end

  test "should destroy Treatment plan exercise" do
    visit treatment_plan_exercise_url(@treatment_plan_exercise)
    click_on "Destroy this treatment plan exercise", match: :first

    assert_text "Treatment plan exercise was successfully destroyed"
  end
end

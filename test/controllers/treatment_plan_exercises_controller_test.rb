require "test_helper"

class TreatmentPlanExercisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @treatment_plan_exercise = treatment_plan_exercises(:one)
  end

  test "should get index" do
    get treatment_plan_exercises_url
    assert_response :success
  end

  test "should get new" do
    get new_treatment_plan_exercise_url
    assert_response :success
  end

  test "should create treatment_plan_exercise" do
    assert_difference("TreatmentPlanExercise.count") do
      post treatment_plan_exercises_url, params: { treatment_plan_exercise: { exercise_id: @treatment_plan_exercise.exercise_id, instructions: @treatment_plan_exercise.instructions, reps: @treatment_plan_exercise.reps, sets: @treatment_plan_exercise.sets, treatment_plan_id: @treatment_plan_exercise.treatment_plan_id } }
    end

    assert_redirected_to treatment_plan_exercise_url(TreatmentPlanExercise.last)
  end

  test "should show treatment_plan_exercise" do
    get treatment_plan_exercise_url(@treatment_plan_exercise)
    assert_response :success
  end

  test "should get edit" do
    get edit_treatment_plan_exercise_url(@treatment_plan_exercise)
    assert_response :success
  end

  test "should update treatment_plan_exercise" do
    patch treatment_plan_exercise_url(@treatment_plan_exercise), params: { treatment_plan_exercise: { exercise_id: @treatment_plan_exercise.exercise_id, instructions: @treatment_plan_exercise.instructions, reps: @treatment_plan_exercise.reps, sets: @treatment_plan_exercise.sets, treatment_plan_id: @treatment_plan_exercise.treatment_plan_id } }
    assert_redirected_to treatment_plan_exercise_url(@treatment_plan_exercise)
  end

  test "should destroy treatment_plan_exercise" do
    assert_difference("TreatmentPlanExercise.count", -1) do
      delete treatment_plan_exercise_url(@treatment_plan_exercise)
    end

    assert_redirected_to treatment_plan_exercises_url
  end
end

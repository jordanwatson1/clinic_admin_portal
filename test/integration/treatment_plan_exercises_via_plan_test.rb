# test/integration/treatment_plan_exercises_via_plan_test.rb
require "test_helper"

class TreatmentPlanExercisesViaPlanTest < ActionDispatch::IntegrationTest
  setup do
    @user     = users(:one)
    sign_in @user

    # Ensure these fixtures all belong to @user (adjust fixtures if needed)
    @patient  = patients(:one)
    @plan     = treatment_plans(:one)
    @exercise = exercises(:one)
  end

  test "add exercise to a plan" do
    assert_difference("TreatmentPlanExercise.count", 1) do
      patch patient_treatment_plan_url(@patient, @plan), params: {
        treatment_plan: {
          title: @plan.title,
          notes: @plan.notes,
          treatment_plan_exercises_attributes: {
            "0" => {
              exercise_id:  @exercise.id,
              sets:         3,
              reps:         10,
              instructions: "Slow and controlled"
            }
          }
        }
      }
    end
    assert_redirected_to patient_treatment_plan_url(@patient, @plan)
  end

  test "update a plan's existing exercise" do
    tpe = treatment_plan_exercises(:one) # belongs to @plan
    patch patient_treatment_plan_url(@patient, @plan), params: {
      treatment_plan: {
        treatment_plan_exercises_attributes: {
          "0" => { id: tpe.id, sets: 5 }
        }
      }
    }
    assert_redirected_to patient_treatment_plan_url(@patient, @plan)
    assert_equal 5, tpe.reload.sets
  end

  test "remove an exercise from a plan" do
    tpe = treatment_plan_exercises(:one)
    assert_difference("TreatmentPlanExercise.count", -1) do
      patch patient_treatment_plan_url(@patient, @plan), params: {
        treatment_plan: {
          treatment_plan_exercises_attributes: {
            "0" => { id: tpe.id, _destroy: "1" }
          }
        }
      }
    end
    assert_redirected_to patient_treatment_plan_url(@patient, @plan)
  end
end

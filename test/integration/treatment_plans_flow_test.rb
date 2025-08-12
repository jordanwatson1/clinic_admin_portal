require "test_helper"

class TreatmentPlansFlowTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @patient = patients(:one)
  end

  test "index lists my patient's plans" do
    get patient_treatment_plans_path(@patient)
    assert_response :success
    assert_select "body", /Knee Rehab/  # adjust for your view content
  end

  test "create plan with nested exercises" do
    exercise = exercises(:one)
    assert_difference "TreatmentPlan.where(user_id: @user.id, patient_id: @patient.id).count", 1 do
      post patient_treatment_plans_path(@patient), params: {
        treatment_plan: {
          title: "New Plan",
          notes: "Go slow",
          treatment_plan_exercises_attributes: [
            { exercise_id: exercise.id, sets: 3, reps: 8, instructions: "Nice form" }
          ]
        }
      }
    end
    assert_response :redirect
  end
end

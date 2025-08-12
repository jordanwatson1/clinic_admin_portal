# test/controllers/treatment_plans_controller_test.rb
require "test_helper"

class ExercisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @patient = patients(:one)
    @plan    = treatment_plans(:one)
  end

  test "index" do
    get patient_treatment_plans_url(@patient)
    assert_response :success
  end
  
  test "new" do
    get new_patient_treatment_plan_url(@patient)
    assert_response :success
  end

  test "create" do
    assert_difference("TreatmentPlan.count") do
      post patient_treatment_plans_url(@patient),
           params: { treatment_plan: { title: "Plan A", notes: "..." } }
    end
    assert_redirected_to patient_treatment_plan_url(@patient, TreatmentPlan.last)
  end

  test "show" do
    get patient_treatment_plan_url(@patient, @plan)
    assert_response :success
  end

  test "edit" do
    get edit_patient_treatment_plan_url(@patient, @plan)
    assert_response :success
  end

  test "update" do
    patch patient_treatment_plan_url(@patient, @plan), params: { treatment_plan: { title: "Updated" } }
    assert_redirected_to patient_treatment_plan_url(@patient, @plan)
  end

  test "destroy" do
    assert_difference("TreatmentPlan.count", -1) do
      delete patient_treatment_plan_url(@patient, @plan)
    end
    assert_redirected_to patient_path(@patient)
  end
end

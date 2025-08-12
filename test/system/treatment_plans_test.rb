# frozen_string_literal: true

require "application_system_test_case"

class TreatmentPlansTest < ApplicationSystemTestCase
  setup do
    @patient = patients(:one)
    @plan    = treatment_plans(:one)
  end

  test "visiting the index" do
    visit patient_treatment_plans_url(@patient)
    assert_selector "h1", text: "Treatment plans" # matches view text/case
  end

  test "should create treatment plan" do
    visit patient_treatment_plans_url(@patient)
    click_on "New treatment plan"
    fill_in "Title", with: "Plan from system test"
    click_on "Save Treatment Plan"
    assert_text "Treatment plan was successfully created"
  end

  test "should update Treatment plan" do
    visit patient_treatment_plan_url(@patient, @plan)
    click_on "Edit Treatment Plan"
    fill_in "Title", with: "Updated in system test"
    click_on "Save Treatment Plan"
    assert_text "Treatment plan was successfully updated"
  end

  test "should destroy Treatment plan" do
    visit patient_treatment_plan_url(@patient, @plan)
    click_button "Delete Plan"
    # flash says "deleted." not "destroyed."
    assert_text "Treatment plan was successfully deleted."
  end
end

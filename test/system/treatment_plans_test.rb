require "application_system_test_case"

class TreatmentPlansTest < ApplicationSystemTestCase
  setup do
    @treatment_plan = treatment_plans(:one)
  end

  test "visiting the index" do
    visit treatment_plans_url
    assert_selector "h1", text: "Treatment plans"
  end

  test "should create treatment plan" do
    visit treatment_plans_url
    click_on "New treatment plan"

    fill_in "Notes", with: @treatment_plan.notes
    fill_in "Title", with: @treatment_plan.title
    click_on "Create Treatment plan"

    assert_text "Treatment plan was successfully created"
    click_on "Back"
  end

  test "should update Treatment plan" do
    visit treatment_plan_url(@treatment_plan)
    click_on "Edit this treatment plan", match: :first

    fill_in "Notes", with: @treatment_plan.notes
    fill_in "Title", with: @treatment_plan.title
    click_on "Update Treatment plan"

    assert_text "Treatment plan was successfully updated"
    click_on "Back"
  end

  test "should destroy Treatment plan" do
    visit treatment_plan_url(@treatment_plan)
    click_on "Destroy this treatment plan", match: :first

    assert_text "Treatment plan was successfully destroyed"
  end
end

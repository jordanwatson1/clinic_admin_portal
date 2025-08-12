# frozen_string_literal: true

require "application_system_test_case"

class PatientsTest < ApplicationSystemTestCase
  setup { @patient = patients(:one) }

  test "visiting the index" do
    visit patients_url
    assert_selector "h1", text: "Patients"
  end

  test "should create patient" do
    visit patients_url
    click_on "New Patient"
    fill_in "First name", with: "Sam"
    fill_in "Last name",  with: "Sample"
    fill_in "Email",      with: "sam@example.com"
    fill_in "Date of Birth", with: "1990-01-01" # date_field expects YYYY-MM-DD
    click_on "Save Patient"
    assert_text "Patient was successfully created"
  end

  test "should update Patient" do
    visit edit_patient_path(@patient) # avoid ambiguous "Edit" links
    fill_in "First name", with: "Updated"
    click_on "Save Patient"
    assert_text "Patient was successfully updated"
  end

  test "should destroy Patient" do
    visit patient_url(@patient)
    click_button "Delete" # this targets the button_to
    assert_text "Patient was successfully destroyed"
  end
end

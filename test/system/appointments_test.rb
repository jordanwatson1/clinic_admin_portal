# frozen_string_literal: true

require "application_system_test_case"

class AppointmentsTest < ApplicationSystemTestCase
  setup do
    @patient     = patients(:one)
    @appointment = appointments(:one)
  end

  test "visiting the index" do
    visit all_appointments_path
    assert_selector "h1", text: "All Appointments"
  end

  test "should create appointment" do
    visit patient_url(@patient)
    click_on "New Appointment"
    fill_in "Start time", with: "2025-01-01T10:00" # datetime-local format
    fill_in "End time",   with: "2025-01-01T10:30"
    fill_in "Notes",      with: "Created via system test"
    click_on "Create Appointment"
    assert_text "Appointment was successfully created"
  end

  test "should update Appointment" do
    visit patient_appointment_url(@patient, @appointment)
    click_on "Edit Appointment"
    fill_in "Notes", with: "Updated via system test"
    click_on "Save Appointment"
    assert_text "Appointment was successfully updated"
  end

  test "should destroy Appointment" do
    visit patient_appointment_url(@patient, @appointment)
    click_button "Delete"
    assert_text "Appointment was successfully destroyed"
  end
end

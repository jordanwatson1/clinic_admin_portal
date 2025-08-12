require "test_helper"

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user

    @patient     = patients(:one)       # belongs to users(:one)
    @appointment = appointments(:one)   # belongs to patients(:one)
  end

  test "index" do
    get patient_appointments_url(@patient)
    assert_response :success
  end

  test "new" do
    get new_patient_appointment_url(@patient)
    assert_response :success
  end

  test "create" do
    assert_difference("Appointment.count", 1) do
      post patient_appointments_url(@patient), params: {
        appointment: {
          start_time: Time.current,
          end_time:   1.hour.from_now,
          notes:      "Check-in"
        }
      }
    end
    assert_redirected_to patient_appointment_url(@patient, Appointment.order(:id).last)
  end

  test "show" do
    get patient_appointment_url(@patient, @appointment)
    assert_response :success
  end

  test "edit" do
    get edit_patient_appointment_url(@patient, @appointment)
    assert_response :success
  end

  test "update" do
    patch patient_appointment_url(@patient, @appointment), params: { appointment: { notes: "Updated" } }
    assert_redirected_to patient_path(@patient) # matches your controller
  end

  test "destroy" do
    assert_difference("Appointment.count", -1) do
      delete patient_appointment_url(@patient, @appointment)
    end
    assert_redirected_to patient_appointments_url(@patient)
  end
end

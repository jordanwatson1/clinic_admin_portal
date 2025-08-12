require "test_helper"

class AppointmentsFlowTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @patient = patients(:one)
  end

  test "create appointment" do
    assert_difference "Appointment.count", 1 do
      post patient_appointments_path(@patient), params: {
        appointment: { start_time: "2025-08-20 10:00:00", end_time: "2025-08-20 10:30:00", notes: "Follow-up" }
      }
    end
    assert_response :redirect
  end
end

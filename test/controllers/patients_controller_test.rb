# test/controllers/patients_controller_test.rb
require "test_helper"

class PatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user

    @patient = patients(:one)
    # Ensure the patient we exercise actually belongs to the signed-in user
    @patient.update!(user: @user) if @patient.user != @user
  end

  test "should get index" do
    get patients_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_url
    assert_response :success
  end

  test "should create patient" do
    assert_difference("Patient.where(user: @user).count") do
      post patients_url, params: {
        patient: {
          first_name: "Pat",
          last_name:  "New",
          email:      "pat.new@example.com",
          phone:      "555-1234",
          dob:        "1990-01-01"
        }
      }
    end
    assert_redirected_to patient_url(Patient.order(:created_at).last)
  end

  test "should show patient" do
    get patient_url(@patient)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_url(@patient)
    assert_response :success
  end

  test "should update patient" do
    patch patient_url(@patient), params: { patient: { first_name: "Updated" } }
    assert_redirected_to patient_url(@patient)
  end

  test "should destroy patient" do
    assert_difference("Patient.where(user: @user).count", -1) do
      delete patient_url(@patient)
    end
    assert_redirected_to patients_url
  end
end

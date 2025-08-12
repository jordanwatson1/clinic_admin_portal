require "test_helper"

class PatientsFlowTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
  end

  test "index shows only my patients" do
    get patients_url
    assert_response :success

    # Belongs to users(:one)
    assert_match(/\bJane One\b/, response.body)

    # Belongs to users(:two) — should NOT be visible
    assert_no_match(/\bJane Two\b/, response.body)

    # (Optional) also ensure the other user's email isn't shown
    assert_no_match(/jane2@example\.com/, response.body)
  end
end

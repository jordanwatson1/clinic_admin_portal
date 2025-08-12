require "test_helper"

class ExercisesFlowTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
  end

  test "create exercise" do
    assert_difference "Exercise.count", 1 do
      post exercises_path, params: { exercise: { title: "Bridge", description: "Hip bridge" } }
    end
    assert_response :redirect
  end
end

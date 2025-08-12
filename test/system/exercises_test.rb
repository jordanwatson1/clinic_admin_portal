# frozen_string_literal: true

require "application_system_test_case"

class ExercisesTest < ApplicationSystemTestCase
  setup { @exercise = exercises(:one) }

  test "visiting the index" do
    visit exercises_url
    assert_selector "h1", text: "Exercises"
  end

  test "should create exercise" do
    visit exercises_url
    click_on "New Exercise"
    fill_in "Title", with: "Bridge"
    fill_in "Description", with: "Glute bridge"
    click_on "Save Exercise"
    assert_text "Exercise was successfully created"
  end

  test "should update Exercise" do
    visit exercise_url(@exercise)
    click_on "Edit Exercise"
    fill_in "Title", with: "Updated"
    click_on "Save Exercise"
    assert_text "Exercise was successfully updated"
  end

  test "should destroy Exercise" do
    # create a disposable record so we don't hit FK constraints
    visit exercises_url
    click_on "New Exercise"
    fill_in "Title", with: "Temp To Delete"
    fill_in "Description", with: "Temp"
    click_on "Save Exercise"

    # use the real <button> from button_to
    click_button "Delete"
    assert_text "Exercise was successfully destroyed"
  end
end

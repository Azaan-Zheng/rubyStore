require "application_system_test_case"

class StarfoldsTest < ApplicationSystemTestCase
  setup do
    @starfold = starfolds(:one)
  end

  test "visiting the index" do
    visit starfolds_url
    assert_selector "h1", text: "Starfolds"
  end

  test "should create starfold" do
    visit starfolds_url
    click_on "New starfold"

    click_on "Create Starfold"

    assert_text "Starfold was successfully created"
    click_on "Back"
  end

  test "should update Starfold" do
    visit starfold_url(@starfold)
    click_on "Edit this starfold", match: :first

    click_on "Update Starfold"

    assert_text "Starfold was successfully updated"
    click_on "Back"
  end

  test "should destroy Starfold" do
    visit starfold_url(@starfold)
    click_on "Destroy this starfold", match: :first

    assert_text "Starfold was successfully destroyed"
  end
end

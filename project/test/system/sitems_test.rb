require "application_system_test_case"

class SitemsTest < ApplicationSystemTestCase
  setup do
    @sitem = sitems(:one)
  end

  test "visiting the index" do
    visit sitems_url
    assert_selector "h1", text: "Sitems"
  end

  test "should create sitem" do
    visit sitems_url
    click_on "New sitem"

    fill_in "Product", with: @sitem.product_id
    fill_in "Starfold", with: @sitem.starfold_id
    click_on "Create Sitem"

    assert_text "Sitem was successfully created"
    click_on "Back"
  end

  test "should update Sitem" do
    visit sitem_url(@sitem)
    click_on "Edit this sitem", match: :first

    fill_in "Product", with: @sitem.product_id
    fill_in "Starfold", with: @sitem.starfold_id
    click_on "Update Sitem"

    assert_text "Sitem was successfully updated"
    click_on "Back"
  end

  test "should destroy Sitem" do
    visit sitem_url(@sitem)
    click_on "Destroy this sitem", match: :first

    assert_text "Sitem was successfully destroyed"
  end
end

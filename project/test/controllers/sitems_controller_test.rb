require "test_helper"

class SitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sitem = sitems(:one)
  end

  test "should get index" do
    get sitems_url
    assert_response :success
  end

  test "should get new" do
    get new_sitem_url
    assert_response :success
  end

  test "should create sitem" do
    assert_difference("Sitem.count") do
      post sitems_url, params: { sitem: { product_id: @sitem.product_id, starfold_id: @sitem.starfold_id } }
    end

    assert_redirected_to sitem_url(Sitem.last)
  end

  test "should show sitem" do
    get sitem_url(@sitem)
    assert_response :success
  end

  test "should get edit" do
    get edit_sitem_url(@sitem)
    assert_response :success
  end

  test "should update sitem" do
    patch sitem_url(@sitem), params: { sitem: { product_id: @sitem.product_id, starfold_id: @sitem.starfold_id } }
    assert_redirected_to sitem_url(@sitem)
  end

  test "should destroy sitem" do
    assert_difference("Sitem.count", -1) do
      delete sitem_url(@sitem)
    end

    assert_redirected_to sitems_url
  end
end

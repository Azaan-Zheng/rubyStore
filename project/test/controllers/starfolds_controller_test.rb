require "test_helper"

class StarfoldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @starfold = starfolds(:one)
  end

  test "should get index" do
    get starfolds_url
    assert_response :success
  end

  test "should get new" do
    get new_starfold_url
    assert_response :success
  end

  test "should create starfold" do
    assert_difference("Starfold.count") do
      post starfolds_url, params: { starfold: {  } }
    end

    assert_redirected_to starfold_url(Starfold.last)
  end

  test "should show starfold" do
    get starfold_url(@starfold)
    assert_response :success
  end

  test "should get edit" do
    get edit_starfold_url(@starfold)
    assert_response :success
  end

  test "should update starfold" do
    patch starfold_url(@starfold), params: { starfold: {  } }
    assert_redirected_to starfold_url(@starfold)
  end

  test "should destroy starfold" do
    assert_difference("Starfold.count", -1) do
      delete starfold_url(@starfold)
    end

    assert_redirected_to starfolds_url
  end
end

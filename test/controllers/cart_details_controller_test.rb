require 'test_helper'

class CartDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cart_details_index_url
    assert_response :success
  end

  test "should get show" do
    get cart_details_show_url
    assert_response :success
  end

  test "should get new" do
    get cart_details_new_url
    assert_response :success
  end

  test "should get create" do
    get cart_details_create_url
    assert_response :success
  end

  test "should get edit" do
    get cart_details_edit_url
    assert_response :success
  end

  test "should get update" do
    get cart_details_update_url
    assert_response :success
  end

  test "should get destroy" do
    get cart_details_destroy_url
    assert_response :success
  end

end

require 'test_helper'

class OrderDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get order_details_index_url
    assert_response :success
  end

  test "should get new" do
    get order_details_new_url
    assert_response :success
  end

  test "should get show" do
    get order_details_show_url
    assert_response :success
  end

  test "should get update" do
    get order_details_update_url
    assert_response :success
  end

  test "should get destroy" do
    get order_details_destroy_url
    assert_response :success
  end

  test "should get delete" do
    get order_details_delete_url
    assert_response :success
  end

  test "should get edit" do
    get order_details_edit_url
    assert_response :success
  end

end

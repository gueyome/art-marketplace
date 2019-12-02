require 'test_helper'

class TestimonialsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get testimonials_index_url
    assert_response :success
  end

  test "should get show" do
    get testimonials_show_url
    assert_response :success
  end

  test "should get edit" do
    get testimonials_edit_url
    assert_response :success
  end

  test "should get create" do
    get testimonials_create_url
    assert_response :success
  end

  test "should get destroy" do
    get testimonials_destroy_url
    assert_response :success
  end

  test "should get update" do
    get testimonials_update_url
    assert_response :success
  end

  test "should get delete" do
    get testimonials_delete_url
    assert_response :success
  end

end

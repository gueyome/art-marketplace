require 'test_helper'

class PrivateMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get private_messages_index_url
    assert_response :success
  end

  test "should get show" do
    get private_messages_show_url
    assert_response :success
  end

  test "should get new" do
    get private_messages_new_url
    assert_response :success
  end

end

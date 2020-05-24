require 'test_helper'

class DealersessionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dealersession_new_url
    assert_response :success
  end

  test "should get create" do
    get dealersession_create_url
    assert_response :success
  end

  test "should get destroy" do
    get dealersession_destroy_url
    assert_response :success
  end

end

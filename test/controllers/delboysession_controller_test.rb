require 'test_helper'

class DelboysessionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get delboysession_new_url
    assert_response :success
  end

  test "should get create" do
    get delboysession_create_url
    assert_response :success
  end

  test "should get destroy" do
    get delboysession_destroy_url
    assert_response :success
  end

end

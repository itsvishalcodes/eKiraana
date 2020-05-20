require 'test_helper'

class CustomersessionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customersession_new_url
    assert_response :success
  end

  test "should get create" do
    get customersession_create_url
    assert_response :success
  end

  test "should get destroy" do
    get customersession_destroy_url
    assert_response :success
  end

end

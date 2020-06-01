require 'test_helper'

class DelaerdeliveryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get delaerdelivery_index_url
    assert_response :success
  end

  test "should get update" do
    get delaerdelivery_update_url
    assert_response :success
  end

end

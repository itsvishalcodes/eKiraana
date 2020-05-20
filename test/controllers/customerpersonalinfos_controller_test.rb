require 'test_helper'

class CustomerpersonalinfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customerpersonalinfo = customerpersonalinfos(:one)
  end

  test "should get index" do
    get customerpersonalinfos_url
    assert_response :success
  end

  test "should get new" do
    get new_customerpersonalinfo_url
    assert_response :success
  end

  test "should create customerpersonalinfo" do
    assert_difference('Customerpersonalinfo.count') do
      post customerpersonalinfos_url, params: { customerpersonalinfo: { address: @customerpersonalinfo.address, name: @customerpersonalinfo.name, phone: @customerpersonalinfo.phone } }
    end

    assert_redirected_to customerpersonalinfo_url(Customerpersonalinfo.last)
  end

  test "should show customerpersonalinfo" do
    get customerpersonalinfo_url(@customerpersonalinfo)
    assert_response :success
  end

  test "should get edit" do
    get edit_customerpersonalinfo_url(@customerpersonalinfo)
    assert_response :success
  end

  test "should update customerpersonalinfo" do
    patch customerpersonalinfo_url(@customerpersonalinfo), params: { customerpersonalinfo: { address: @customerpersonalinfo.address, name: @customerpersonalinfo.name, phone: @customerpersonalinfo.phone } }
    assert_redirected_to customerpersonalinfo_url(@customerpersonalinfo)
  end

  test "should destroy customerpersonalinfo" do
    assert_difference('Customerpersonalinfo.count', -1) do
      delete customerpersonalinfo_url(@customerpersonalinfo)
    end

    assert_redirected_to customerpersonalinfos_url
  end
end

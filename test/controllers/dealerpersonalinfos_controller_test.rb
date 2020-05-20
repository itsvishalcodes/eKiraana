require 'test_helper'

class DealerpersonalinfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dealerpersonalinfo = dealerpersonalinfos(:one)
  end

  test "should get index" do
    get dealerpersonalinfos_url
    assert_response :success
  end

  test "should get new" do
    get new_dealerpersonalinfo_url
    assert_response :success
  end

  test "should create dealerpersonalinfo" do
    assert_difference('Dealerpersonalinfo.count') do
      post dealerpersonalinfos_url, params: { dealerpersonalinfo: { phone: @dealerpersonalinfo.phone, rating: @dealerpersonalinfo.rating, review: @dealerpersonalinfo.review, shopname: @dealerpersonalinfo.shopname } }
    end

    assert_redirected_to dealerpersonalinfo_url(Dealerpersonalinfo.last)
  end

  test "should show dealerpersonalinfo" do
    get dealerpersonalinfo_url(@dealerpersonalinfo)
    assert_response :success
  end

  test "should get edit" do
    get edit_dealerpersonalinfo_url(@dealerpersonalinfo)
    assert_response :success
  end

  test "should update dealerpersonalinfo" do
    patch dealerpersonalinfo_url(@dealerpersonalinfo), params: { dealerpersonalinfo: { phone: @dealerpersonalinfo.phone, rating: @dealerpersonalinfo.rating, review: @dealerpersonalinfo.review, shopname: @dealerpersonalinfo.shopname } }
    assert_redirected_to dealerpersonalinfo_url(@dealerpersonalinfo)
  end

  test "should destroy dealerpersonalinfo" do
    assert_difference('Dealerpersonalinfo.count', -1) do
      delete dealerpersonalinfo_url(@dealerpersonalinfo)
    end

    assert_redirected_to dealerpersonalinfos_url
  end
end

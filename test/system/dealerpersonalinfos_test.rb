require "application_system_test_case"

class DealerpersonalinfosTest < ApplicationSystemTestCase
  setup do
    @dealerpersonalinfo = dealerpersonalinfos(:one)
  end

  test "visiting the index" do
    visit dealerpersonalinfos_url
    assert_selector "h1", text: "Dealerpersonalinfos"
  end

  test "creating a Dealerpersonalinfo" do
    visit dealerpersonalinfos_url
    click_on "New Dealerpersonalinfo"

    fill_in "Phone", with: @dealerpersonalinfo.phone
    fill_in "Rating", with: @dealerpersonalinfo.rating
    fill_in "Review", with: @dealerpersonalinfo.review
    fill_in "Shopname", with: @dealerpersonalinfo.shopname
    click_on "Create Dealerpersonalinfo"

    assert_text "Dealerpersonalinfo was successfully created"
    click_on "Back"
  end

  test "updating a Dealerpersonalinfo" do
    visit dealerpersonalinfos_url
    click_on "Edit", match: :first

    fill_in "Phone", with: @dealerpersonalinfo.phone
    fill_in "Rating", with: @dealerpersonalinfo.rating
    fill_in "Review", with: @dealerpersonalinfo.review
    fill_in "Shopname", with: @dealerpersonalinfo.shopname
    click_on "Update Dealerpersonalinfo"

    assert_text "Dealerpersonalinfo was successfully updated"
    click_on "Back"
  end

  test "destroying a Dealerpersonalinfo" do
    visit dealerpersonalinfos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dealerpersonalinfo was successfully destroyed"
  end
end

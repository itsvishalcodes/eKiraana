require "application_system_test_case"

class CustomerpersonalinfosTest < ApplicationSystemTestCase
  setup do
    @customerpersonalinfo = customerpersonalinfos(:one)
  end

  test "visiting the index" do
    visit customerpersonalinfos_url
    assert_selector "h1", text: "Customerpersonalinfos"
  end

  test "creating a Customerpersonalinfo" do
    visit customerpersonalinfos_url
    click_on "New Customerpersonalinfo"

    fill_in "Address", with: @customerpersonalinfo.address
    fill_in "Name", with: @customerpersonalinfo.name
    fill_in "Phone", with: @customerpersonalinfo.phone
    click_on "Create Customerpersonalinfo"

    assert_text "Customerpersonalinfo was successfully created"
    click_on "Back"
  end

  test "updating a Customerpersonalinfo" do
    visit customerpersonalinfos_url
    click_on "Edit", match: :first

    fill_in "Address", with: @customerpersonalinfo.address
    fill_in "Name", with: @customerpersonalinfo.name
    fill_in "Phone", with: @customerpersonalinfo.phone
    click_on "Update Customerpersonalinfo"

    assert_text "Customerpersonalinfo was successfully updated"
    click_on "Back"
  end

  test "destroying a Customerpersonalinfo" do
    visit customerpersonalinfos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customerpersonalinfo was successfully destroyed"
  end
end

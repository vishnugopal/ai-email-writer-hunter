require "application_system_test_case"

class SendersTest < ApplicationSystemTestCase
  setup do
    @sender = senders(:one)
  end

  test "visiting the index" do
    visit senders_url
    assert_selector "h1", text: "Senders"
  end

  test "should create sender" do
    visit senders_url
    click_on "New sender"

    fill_in "Contact details", with: @sender.contact_details
    fill_in "Name", with: @sender.name
    fill_in "Organization", with: @sender.organization
    fill_in "Organization website", with: @sender.organization_website
    fill_in "Title", with: @sender.title
    click_on "Create Sender"

    assert_text "Sender was successfully created"
    click_on "Back"
  end

  test "should update Sender" do
    visit sender_url(@sender)
    click_on "Edit this sender", match: :first

    fill_in "Contact details", with: @sender.contact_details
    fill_in "Name", with: @sender.name
    fill_in "Organization", with: @sender.organization
    fill_in "Organization website", with: @sender.organization_website
    fill_in "Title", with: @sender.title
    click_on "Update Sender"

    assert_text "Sender was successfully updated"
    click_on "Back"
  end

  test "should destroy Sender" do
    visit sender_url(@sender)
    click_on "Destroy this sender", match: :first

    assert_text "Sender was successfully destroyed"
  end
end

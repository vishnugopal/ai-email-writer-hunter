require "test_helper"

class RecipientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipient = recipients(:one)
  end

  test "should get index" do
    get recipients_url
    assert_response :success
  end

  test "should get new" do
    get new_recipient_url
    assert_response :success
  end

  test "should create recipient" do
    assert_difference("Recipient.count") do
      post recipients_url, params: { recipient: { name: @recipient.name, organization: @recipient.organization, organization_website: @recipient.organization_website, personalization_hints: @recipient.personalization_hints, title: @recipient.title, type_of_recipient: @recipient.type_of_recipient } }
    end

    assert_redirected_to recipient_url(Recipient.last)
  end

  test "should show recipient" do
    get recipient_url(@recipient)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipient_url(@recipient)
    assert_response :success
  end

  test "should update recipient" do
    patch recipient_url(@recipient), params: { recipient: { name: @recipient.name, organization: @recipient.organization, organization_website: @recipient.organization_website, personalization_hints: @recipient.personalization_hints, title: @recipient.title, type_of_recipient: @recipient.type_of_recipient } }
    assert_redirected_to recipient_url(@recipient)
  end

  test "should destroy recipient" do
    assert_difference("Recipient.count", -1) do
      delete recipient_url(@recipient)
    end

    assert_redirected_to recipients_url
  end
end

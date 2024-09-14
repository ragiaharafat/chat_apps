require "application_system_test_case"

class CreateChatsTest < ApplicationSystemTestCase
  setup do
    @create_chat = create_chats(:one)
  end

  test "visiting the index" do
    visit create_chats_url
    assert_selector "h1", text: "Create chats"
  end

  test "should create create chat" do
    visit create_chats_url
    click_on "New create chat"

    fill_in "Application", with: @create_chat.application_id
    fill_in "Messages count", with: @create_chat.messages_count
    fill_in "Number", with: @create_chat.number
    click_on "Create Create chat"

    assert_text "Create chat was successfully created"
    click_on "Back"
  end

  test "should update Create chat" do
    visit create_chat_url(@create_chat)
    click_on "Edit this create chat", match: :first

    fill_in "Application", with: @create_chat.application_id
    fill_in "Messages count", with: @create_chat.messages_count
    fill_in "Number", with: @create_chat.number
    click_on "Update Create chat"

    assert_text "Create chat was successfully updated"
    click_on "Back"
  end

  test "should destroy Create chat" do
    visit create_chat_url(@create_chat)
    click_on "Destroy this create chat", match: :first

    assert_text "Create chat was successfully destroyed"
  end
end

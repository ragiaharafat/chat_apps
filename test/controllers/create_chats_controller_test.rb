require "test_helper"

class CreateChatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @create_chat = create_chats(:one)
  end

  test "should get index" do
    get create_chats_url
    assert_response :success
  end

  test "should get new" do
    get new_create_chat_url
    assert_response :success
  end

  test "should create create_chat" do
    assert_difference("CreateChat.count") do
      post create_chats_url, params: { create_chat: { application_id: @create_chat.application_id, messages_count: @create_chat.messages_count, number: @create_chat.number } }
    end

    assert_redirected_to create_chat_url(CreateChat.last)
  end

  test "should show create_chat" do
    get create_chat_url(@create_chat)
    assert_response :success
  end

  test "should get edit" do
    get edit_create_chat_url(@create_chat)
    assert_response :success
  end

  test "should update create_chat" do
    patch create_chat_url(@create_chat), params: { create_chat: { application_id: @create_chat.application_id, messages_count: @create_chat.messages_count, number: @create_chat.number } }
    assert_redirected_to create_chat_url(@create_chat)
  end

  test "should destroy create_chat" do
    assert_difference("CreateChat.count", -1) do
      delete create_chat_url(@create_chat)
    end

    assert_redirected_to create_chats_url
  end
end

require 'test_helper'

class FileMessagesControllerTest < ActionController::TestCase
  setup do
    @file_message = file_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:file_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create file_message" do
    assert_difference('FileMessage.count') do
      post :create, file_message: { bytes: @file_message.bytes, created_at: @file_message.created_at, icon: @file_message.icon, is_new: @file_message.is_new, link: @file_message.link, name: @file_message.name, recipient_id: @file_message.recipient_id, sender_id: @file_message.sender_id, thumbnailLink: @file_message.thumbnailLink }
    end

    assert_redirected_to file_message_path(assigns(:file_message))
  end

  test "should show file_message" do
    get :show, id: @file_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @file_message
    assert_response :success
  end

  test "should update file_message" do
    patch :update, id: @file_message, file_message: { bytes: @file_message.bytes, created_at: @file_message.created_at, icon: @file_message.icon, is_new: @file_message.is_new, link: @file_message.link, name: @file_message.name, recipient_id: @file_message.recipient_id, sender_id: @file_message.sender_id, thumbnailLink: @file_message.thumbnailLink }
    assert_redirected_to file_message_path(assigns(:file_message))
  end

  test "should destroy file_message" do
    assert_difference('FileMessage.count', -1) do
      delete :destroy, id: @file_message
    end

    assert_redirected_to file_messages_path
  end
end

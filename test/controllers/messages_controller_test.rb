require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    @message = FactoryGirl.create(:message)
  end

  test "should not get new without auth" do
    fails_to_login {
      get :new
    }
  end

  test "should not post new without auth" do
    fails_to_login {
      get :new
    }
  end

  test "should post new" do
    as_user
    post :new, message: { to_user_id: @message.to_user_id }
    assert_response :success
  end

  test "should not create message without auth" do
    fails_to_login {
      post :create, message: { body: @message.body, subject: @message.subject }
    }
  end

  test "should create message" do
    as_user
    assert_difference('Message.count') do
      post :create, message: { body: @message.body, subject: @message.subject }
    end

    assert_redirected_to message_path(assigns(:message))
  end
end

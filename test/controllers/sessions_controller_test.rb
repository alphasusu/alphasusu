require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  
  test "should get new" do
    @request.env["devise.mapping"] = Devise.mappings[:local_user]
    get :new
    assert_response :success
  end

  test "should destroy session" do
    @request.env["devise.mapping"] = Devise.mappings[:local_user]
    delete :destroy
    assert_redirected_to root_path
  end

end

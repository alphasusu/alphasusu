require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  setup do
    @profile = FactoryGirl.create(:user)
  end

  test "should show profile" do
    get :show, id: @profile
    assert_response :success
  end

  test "should not get edit without auth" do
    as_nobody
    fails_to_login {
      get :edit, id: @profile
    }
  end

  test "should not get edit without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @profile
    }
  end

  test "should get edit" do
    as_admin
    get :edit, id: @profile
    assert_response :success
  end

  test "should not update profile without auth" do
    as_nobody
    fails_to_login {
      patch :update, id: @profile, profile: { email: @profile.email, first_name: @profile.first_name, last_name: @profile.last_name, course_id: @profile.course_id, year: @profile.year }
    }
  end

  test "should not update profile without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @profile, profile: { email: @profile.email, first_name: @profile.first_name, last_name: @profile.last_name, course_id: @profile.course_id, year: @profile.year }
    }
  end

  test "should update profile" do
    as_admin
    patch :update, id: @profile, profile: { email: @profile.email, first_name: @profile.first_name, last_name: @profile.last_name, course_id: @profile.course_id, year: @profile.year }
    assert_redirected_to profile_path
  end

  test "should not destroy profile without auth" do
    as_nobody
    fails_to_login {
      delete :destroy, id: @profile
    }
  end

  test "should not destroy profile without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @profile
    }
  end

  test "should destroy profile" do
    as_admin
    assert_difference('User.count', -1) do
      delete :destroy, id: @profile
    end

    assert_redirected_to new_session_path
  end
end

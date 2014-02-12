require 'test_helper'

class PermissionsControllerTest < ActionController::TestCase
  setup do
    @permission = FactoryGirl.create(:permission)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:permissions)
  end

  test "should not get new without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      get :new
    }
  end

  test "should not get new without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      get :new
    }
  end

  test "should get new" do
    as_admin
    get :new
    assert_response :success
  end

  test "should not create permission without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      post :create, permission: { action: @permission.action, subject_class: @permission.subject_class, subject_id: @permission.subject_id, user_id: @permission.user_id }
    }
  end

  test "should not create permission without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      post :create, permission: { action: @permission.action, subject_class: @permission.subject_class, subject_id: @permission.subject_id, user_id: @permission.user_id }
    }
  end

  test "should create permission" do
    as_admin
    assert_difference('Permission.count') do
      post :create, permission: { action: @permission.action, subject_class: @permission.subject_class, subject_id: @permission.subject_id, user_id: @permission.user_id }
    end

    assert_redirected_to permission_path(assigns(:permission))
  end

  test "should show permission" do
    get :show, id: @permission
    assert_response :success
  end

  test "should not get edit without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @permission
    }
  end

  test "should not get edit without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @permission
    }
  end

  test "should get edit" do
    as_admin
    get :edit, id: @permission
    assert_response :success
  end

  test "should not update permission without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @permission, permission: { action: @permission.action, subject_class: @permission.subject_class, subject_id: @permission.subject_id, user_id: @permission.user_id }
    }
  end

  test "should not update permission without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @permission, permission: { action: @permission.action, subject_class: @permission.subject_class, subject_id: @permission.subject_id, user_id: @permission.user_id }
    }
  end

  test "should update permission" do
    as_admin
    patch :update, id: @permission, permission: { action: @permission.action, subject_class: @permission.subject_class, subject_id: @permission.subject_id, user_id: @permission.user_id }
    assert_redirected_to permission_path(assigns(:permission))
  end

  test "should not destroy permission without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @permission
    }
  end

  test "should not destroy permission without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @permission
    }
  end

  test "should destroy permission" do
    as_admin
    assert_difference('Permission.count', -1) do
      delete :destroy, id: @permission
    end

    assert_redirected_to permissions_path
  end
end

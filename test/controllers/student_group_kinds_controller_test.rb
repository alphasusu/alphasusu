require 'test_helper'

class StudentGroupKindsControllerTest < ActionController::TestCase
  setup do
    @student_group_kind = FactoryGirl.create(:student_group_kind)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_group_kinds)
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

  test "should not create student_group_kind without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      post :create, student_group_kind: { description: @student_group_kind.description, name: @student_group_kind.name }
    }
  end

  test "should not create student_group_kind without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      post :create, student_group_kind: { description: @student_group_kind.description, name: @student_group_kind.name }
    }
  end

  test "should create student_group_kind" do
    as_admin
    assert_difference('StudentGroupKind.count') do
      post :create, student_group_kind: { description: @student_group_kind.description, name: (0...8).map { (65 + rand(26)).chr }.join }
    end

    assert_redirected_to student_group_kind_path(assigns(:student_group_kind))
  end

  test "should show student_group_kind" do
    get :show, id: @student_group_kind
    assert_response :success
  end

  test "should not get edit without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @student_group_kind
    }
  end

  test "should not get edit without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @student_group_kind
    }
  end

  test "should get edit" do
    as_admin
    get :edit, id: @student_group_kind
    assert_response :success
  end

  test "should not update student_group_kind without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @student_group_kind, student_group_kind: { description: @student_group_kind.description, name: @student_group_kind.name }
    }
  end

  test "should not update student_group_kind without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @student_group_kind, student_group_kind: { description: @student_group_kind.description, name: @student_group_kind.name }
    }
  end

  test "should update student_group_kind" do
    as_admin
    patch :update, id: @student_group_kind, student_group_kind: { description: @student_group_kind.description, name: @student_group_kind.name }
    assert_redirected_to student_group_kind_path(assigns(:student_group_kind))
  end

  test "should not destroy student_group_kind without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @student_group_kind
    }
  end

  test "should not destroy student_group_kind without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @student_group_kind
    }
  end

  test "should destroy student_group_kind" do
    as_admin
    assert_difference('StudentGroupKind.count', -1) do
      delete :destroy, id: @student_group_kind
    end

    assert_redirected_to student_group_kinds_path
  end
end

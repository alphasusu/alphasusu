require 'test_helper'

class StudentGroupsControllerTest < ActionController::TestCase
  setup do
    @student_group = FactoryGirl.create(:student_group)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_groups)
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

  test "should not create student_group without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      post :create, student_group: { description: @student_group.description, name: @student_group.name }
    }
  end

  test "should not create student_group without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      post :create, student_group: { description: @student_group.description, name: @student_group.name }
    }
  end

  test "should create student_group" do
    as_admin
    assert_difference('StudentGroup.count') do
      post :create, student_group: { description: @student_group.description, name: @student_group.name }
    end

    assert_redirected_to student_group_path(assigns(:student_group))
  end

  test "should show student_group" do
    get :show, id: @student_group
    assert_response :success
  end

  test "should not get edit without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @student_group
    }
  end

  test "should not get edit without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @student_group
    }
  end

  test "should get edit" do
    as_admin
    get :edit, id: @student_group
    assert_response :success
  end

  test "should not update student_group without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @student_group, student_group: { description: @student_group.description, name: @student_group.name }
    }
  end

  test "should not update student_group without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @student_group, student_group: { description: @student_group.description, name: @student_group.name }
    }
  end

  test "should update student_group" do
    as_admin
    patch :update, id: @student_group, student_group: { description: @student_group.description, name: @student_group.name }
    assert_redirected_to student_group_path(assigns(:student_group))
  end

  test "should not destroy student_group without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @student_group
    }
  end

  test "should not destroy student_group without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @student_group
    }
  end

  test "should destroy student_group" do
    as_admin
    assert_difference('StudentGroup.count', -1) do
      delete :destroy, id: @student_group
    end

    assert_redirected_to student_groups_path
  end
end

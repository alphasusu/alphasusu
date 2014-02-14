require 'test_helper'

class StudentGroupKindsControllerTest < ActionController::TestCase
  setup do
    @student_group_kind = student_group_kinds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_group_kinds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_group_kind" do
    assert_difference('StudentGroupKind.count') do
      post :create, student_group_kind: { description: @student_group_kind.description, name: @student_group_kind.name }
    end

    assert_redirected_to student_group_kind_path(assigns(:student_group_kind))
  end

  test "should show student_group_kind" do
    get :show, id: @student_group_kind
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_group_kind
    assert_response :success
  end

  test "should update student_group_kind" do
    patch :update, id: @student_group_kind, student_group_kind: { description: @student_group_kind.description, name: @student_group_kind.name }
    assert_redirected_to student_group_kind_path(assigns(:student_group_kind))
  end

  test "should destroy student_group_kind" do
    assert_difference('StudentGroupKind.count', -1) do
      delete :destroy, id: @student_group_kind
    end

    assert_redirected_to student_group_kinds_path
  end
end

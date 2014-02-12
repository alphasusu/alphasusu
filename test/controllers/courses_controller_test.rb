require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @course = FactoryGirl.create(:course)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
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

  test "should not create course without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      post :create, course: { name: @course.name, academic_unit_id: @course.academic_unit_id }
    }
  end

  test "should not create course without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      post :create, course: { name: @course.name, academic_unit_id: @course.academic_unit_id }
    }
  end

  test "should create course" do
    as_admin
    assert_difference('Course.count') do
      post :create, course: { name: @course.name, academic_unit_id: @course.academic_unit_id }
    end

    assert_redirected_to course_path(assigns(:course))
  end

  test "should show course" do
    get :show, id: @course
    assert_response :success
  end

  test "should not get edit without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @course
    }
  end

  test "should not get edit without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @course
    }
  end

  test "should get edit" do
    as_admin
    get :edit, id: @course
    assert_response :success
  end

  test "should not update course without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @course, course: { name: @course.name, academic_unit_id: @course.academic_unit_id }
    }
  end

  test "should not update course without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @course, course: { name: @course.name, academic_unit_id: @course.academic_unit_id }
    }
  end

  test "should update course" do
    as_admin
    patch :update, id: @course, course: { name: @course.name, academic_unit_id: @course.academic_unit_id }
    assert_redirected_to course_path(assigns(:course))
  end

  test "should not destroy course without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @course
    }
  end

  test "should not destroy course without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @course
    }
  end

  test "should destroy course" do
    as_admin
    assert_difference('Course.count', -1) do
      delete :destroy, id: @course
    end

    assert_redirected_to courses_path
  end
end

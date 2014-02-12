require 'test_helper'

class CourseRepresentativesControllerTest < ActionController::TestCase
  setup do
    @course_representative = FactoryGirl.create(:course_representative)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_representatives)
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

  test "should not create course_representative without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      post :create, course_representative: { user_id: @course_representative.user_id, course: @course_representative.course_id, year: @course_representative.year }
    }
  end

  test "should not create course_representative without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      post :create, course_representative: { user_id: @course_representative.user_id, course: @course_representative.course_id, year: @course_representative.year }
    }
  end

  test "should create course_representative" do
    as_admin
    assert_difference('CourseRepresentative.count') do
      post :create, course_representative: { user_id: @course_representative.user_id, course: @course_representative.course_id, year: @course_representative.year }
    end

    assert_redirected_to course_representative_path(assigns(:course_representative))
  end

  test "should show course_representative" do
    get :show, id: @course_representative
    assert_response :success
  end

  test "should not get edit without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @course_representative
    }
  end

  test "should not get edit without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @course_representative
    }
  end

  test "should get edit" do
    as_admin
    get :edit, id: @course_representative
    assert_response :success
  end

  test "should not update course_representative without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @course_representative, course_representative: { user_id: @course_representative.user_id, course: @course_representative.course_id, year: @course_representative.year }
    }
  end

  test "should not update course_representative without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @course_representative, course_representative: { user_id: @course_representative.user_id, course: @course_representative.course_id, year: @course_representative.year }
    }
  end

  test "should update course_rep" do
    as_admin
    patch :update, id: @course_representative, course_representative: { user_id: @course_representative.user_id, course: @course_representative.course_id, year: @course_representative.year }
    assert_redirected_to course_representative_path(assigns(:course_representative))
  end

  test "should not destroy course_representative without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @course_representative
    }
  end

  test "should not destroy course_representative without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @course_representative
    }
  end

  test "should destroy course_representative" do
    as_admin
    assert_difference('CourseRepresentative.count', -1) do
      delete :destroy, id: @course_representative
    end

    assert_redirected_to course_representatives_path
  end
end

require 'test_helper'

class IssuesControllerTest < ActionController::TestCase
  setup do
    @issue = FactoryGirl.create(:issue)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issues)
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

  test "should not create issue without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      post :create, issue: { description: @issue.description, title: @issue.title }
    }
  end

  test "should not create issue without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      post :create, issue: { description: @issue.description, title: @issue.title }
    }
  end

  test "should create issue" do
    as_admin
    assert_difference('Issue.count') do
      post :create, issue: { description: @issue.description, title: @issue.title }
    end

    assert_redirected_to issue_path(assigns(:issue))
  end

  test "should show issue" do
    get :show, id: @issue
    assert_response :success
  end

  test "should not get edit without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @issue
    }
  end

  test "should not get edit without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @issue
    }
  end

  test "should get edit" do
    as_admin
    get :edit, id: @issue
    assert_response :success
  end

  test "should not update issue without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @issue, issue: { description: @issue.description, title: @issue.title }
    }
  end

  test "should not update issue without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @issue, issue: { description: @issue.description, title: @issue.title }
    }
  end

  test "should update issue" do
    as_admin
    patch :update, id: @issue, issue: { description: @issue.description, title: @issue.title }
    assert_redirected_to issue_path(assigns(:issue))
  end

  test "should not destroy issue without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @issue
    }
  end

  test "should not destroy issue without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @issue
    }
  end

  test "should destroy issue" do
    as_admin
    assert_difference('Issue.count', -1) do
      delete :destroy, id: @issue
    end

    assert_redirected_to issues_path
  end
end

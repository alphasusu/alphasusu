require 'test_helper'

class HeadlinesControllerTest < ActionController::TestCase
  setup do
    @headline = FactoryGirl.create(:headline)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:headlines)
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

  test "should not create headline without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      post :create, headline: { body: @headline.body, title: @headline.title }
    }
  end

  test "should not create headline without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      post :create, headline: { body: @headline.body, title: @headline.title }
    }
  end

  test "should create headline" do
    as_admin
    assert_difference('Headline.count') do
      post :create, headline: { body: @headline.body, title: @headline.title }
    end

    assert_redirected_to headline_path(assigns(:headline))
  end

  test "should show headline" do
    get :show, id: @headline
    assert_response :success
  end

  test "should not get edit without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @headline
    }
  end

  test "should not get edit without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @headline
    }
  end

  test "should get edit" do
    as_admin
    get :edit, id: @headline
    assert_response :success
  end

  test "should not update headline without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @headline, headline: { body: @headline.body, title: @headline.title }
    }
  end

  test "should not update headline without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @headline, headline: { body: @headline.body, title: @headline.title }
    }
  end

  test "should update headline" do
    as_admin
    patch :update, id: @headline, headline: { body: @headline.body, title: @headline.title }
    assert_redirected_to headline_path(assigns(:headline))
  end

  test "should not destroy headline without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @headline
    }
  end

  test "should not destroy headline without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @headline
    }
  end

  test "should destroy headline" do
    as_admin
    assert_difference('Headline.count', -1) do
      delete :destroy, id: @headline
    end

    assert_redirected_to headlines_path
  end
end

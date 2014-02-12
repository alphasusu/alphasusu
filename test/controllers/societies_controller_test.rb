require 'test_helper'

class SocietiesControllerTest < ActionController::TestCase
  setup do
    @society = FactoryGirl.create(:society)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:societies)
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

  test "should not create society without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      post :create, society: { description: @society.description, name: @society.name }
    }
  end

  test "should not create society without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      post :create, society: { description: @society.description, name: @society.name }
    }
  end

  test "should create society" do
    as_admin
    assert_difference('Society.count') do
      post :create, society: { description: @society.description, name: @society.name }
    end

    assert_redirected_to society_path(assigns(:society))
  end

  test "should show society" do
    get :show, id: @society
    assert_response :success
  end

  test "should get edit" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @society
    }
  end

  test "should get edit" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @society
    }
  end

  test "should get edit" do
    as_admin
    get :edit, id: @society
    assert_response :success
  end

  test "should not update society without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @society, society: { description: @society.description, name: @society.name }
    }
  end

  test "should not update society without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @society, society: { description: @society.description, name: @society.name }
    }
  end

  test "should update society" do
    as_admin
    patch :update, id: @society, society: { description: @society.description, name: @society.name }
    assert_redirected_to society_path(assigns(:society))
  end

  test "should destroy society" do
    assert_difference('Society.count', -1) do
      delete :destroy, id: @society
    end

    assert_redirected_to societies_path
  end
end

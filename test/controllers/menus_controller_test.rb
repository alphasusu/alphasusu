require 'test_helper'

class MenusControllerTest < ActionController::TestCase
  setup do
    @menu = FactoryGirl.create(:menu)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:menus)
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

  test "should not create menu without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      post :create, menu: {  }
    }
  end

  test "should not create menu without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      post :create, menu: {  }
    }
  end

  test "should create menu" do
    as_admin
    assert_difference('Menu.count') do
      post :create, menu: {  }
    end

    assert_redirected_to menu_path(assigns(:menu))
  end

  test "should show menu" do
    get :show, id: @menu
    assert_response :success
  end

  test "should not get edit without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @menu
    }
  end

  test "should not get edit without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @menu
    }
  end

  test "should get edit" do
    as_admin
    get :edit, id: @menu
    assert_response :success
  end

  test "should not update menu without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @menu, menu: {  }
    }
  end

  test "should not update menu without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @menu, menu: {  }
    }
  end

  test "should update menu" do
    as_admin
    patch :update, id: @menu, menu: {  }
    assert_redirected_to menu_path(assigns(:menu))
  end

  test "should not destroy menu without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @menu
    }
  end

  test "should not destroy menu without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @menu
    }
  end

  test "should destroy menu" do
    as_admin
    assert_difference('Menu.count', -1) do
      delete :destroy, id: @menu
    end

    assert_redirected_to menus_path
  end
end

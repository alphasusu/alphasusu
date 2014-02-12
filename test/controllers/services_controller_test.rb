require 'test_helper'

class ServicesControllerTest < ActionController::TestCase
  setup do
    @service = FactoryGirl.create(:service)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:services)
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

  test "should not create service without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      post :create, service: {  }
    }
  end

  test "should not create service without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      post :create, service: {  }
    }
  end

  test "should create service" do
    as_admin
    assert_difference('Service.count') do
      post :create, service: {  }
    end

    assert_redirected_to service_path(assigns(:service))
  end

  test "should show service" do
    get :show, id: @service
    assert_response :success
  end

  test "should not get edit without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @service
    }
  end

  test "should not get edit without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @service
    }
  end

  test "should get edit" do
    as_admin
    get :edit, id: @service
    assert_response :success
  end

  test "should not update service without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @service, service: {  }
    }
  end

  test "should not update service without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @service, service: {  }
    }
  end

  test "should update service" do
    as_admin
    patch :update, id: @service, service: {  }
    assert_redirected_to service_path(assigns(:service))
  end

  test "should not destroy service without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @service
    }
  end

  test "should not destroy service without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @service
    }
  end

  test "should destroy service" do
    as_admin
    assert_difference('Service.count', -1) do
      delete :destroy, id: @service
    end

    assert_redirected_to services_path
  end
end

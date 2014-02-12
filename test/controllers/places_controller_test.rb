require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  setup do
    @place = FactoryGirl.create(:place)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:places)
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

  test "should not create place without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      post :create, place: { description: @place.description, latitude: @place.latitude, longitude: @place.longitude, name: @place.name }
    }
  end

  test "should not create place without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      post :create, place: { description: @place.description, latitude: @place.latitude, longitude: @place.longitude, name: @place.name }
    }
  end

  test "should create place" do
    as_admin
    assert_difference('Place.count') do
      post :create, place: { description: @place.description, latitude: @place.latitude, longitude: @place.longitude, name: @place.name }
    end

    assert_redirected_to place_path(assigns(:place))
  end

  test "should show place" do
    get :show, id: @place
    assert_response :success
  end

  test "should not get edit without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @place
    }
  end

  test "should not get edit without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @place
    }
  end

  test "should get edit" do
    as_admin
    get :edit, id: @place
    assert_response :success
  end

  test "should not update place without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @place, place: { description: @place.description, latitude: @place.latitude, longitude: @place.longitude, name: @place.name }
    }
  end

  test "should not update place without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @place, place: { description: @place.description, latitude: @place.latitude, longitude: @place.longitude, name: @place.name }
    }
  end

  test "should update place" do
    as_admin
    patch :update, id: @place, place: { description: @place.description, latitude: @place.latitude, longitude: @place.longitude, name: @place.name }
    assert_redirected_to place_path(assigns(:place))
  end

  test "should not destroy place without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @place
    }
  end

  test "should not destroy place without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @place
    }
  end

  test "should destroy place" do
    as_admin
    assert_difference('Place.count', -1) do
      delete :destroy, id: @place
    end

    assert_redirected_to places_path
  end
end

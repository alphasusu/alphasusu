require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = FactoryGirl.create(:event)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
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

  test "should not create event without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      post :create, event: { title: @event.title, description: @event.description, date: @event.date, place_id: @event.place_id }
    }
  end

  test "should not create event without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      post :create, event: { title: @event.title, description: @event.description, date: @event.date, place_id: @event.place_id }
    }
  end

  test "should create event" do
    as_admin
    assert_difference('Event.count') do
      post :create, event: { title: @event.title, description: @event.description, date: @event.date, place_id: @event.place_id }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should not get edit without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @event
    }
  end

  test "should not get edit without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @event
    }
  end

  test "should get edit" do
    as_admin
    get :edit, id: @event
    assert_response :success
  end

  test "should not update event without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @event, event: { title: @event.title, description: @event.description, date: @event.date, place_id: @event.place_id }
    }
  end

  test "should not update event without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @event, event: { title: @event.title, description: @event.description, date: @event.date, place_id: @event.place_id }
    }
  end

  test "should update event" do
    as_admin
    patch :update, id: @event, event: { title: @event.title, description: @event.description, date: @event.date, place_id: @event.place_id }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should not destroy event without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @event
    }
  end

  test "should not destroy event without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @event
    }
  end

  test "should destroy event" do
    as_admin
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end

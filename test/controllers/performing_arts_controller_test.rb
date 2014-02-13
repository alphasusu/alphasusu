require 'test_helper'

class PerformingArtsControllerTest < ActionController::TestCase
  setup do
    @performing_art = performing_arts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:performing_arts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create performing_art" do
    assert_difference('PerformingArt.count') do
      post :create, performing_art: {  }
    end

    assert_redirected_to performing_art_path(assigns(:performing_art))
  end

  test "should show performing_art" do
    get :show, id: @performing_art
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @performing_art
    assert_response :success
  end

  test "should update performing_art" do
    patch :update, id: @performing_art, performing_art: {  }
    assert_redirected_to performing_art_path(assigns(:performing_art))
  end

  test "should destroy performing_art" do
    assert_difference('PerformingArt.count', -1) do
      delete :destroy, id: @performing_art
    end

    assert_redirected_to performing_arts_path
  end
end

require 'test_helper'

class MediaGroupsControllerTest < ActionController::TestCase
  setup do
    @media_group = media_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:media_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create media_group" do
    assert_difference('MediaGroup.count') do
      post :create, media_group: {  }
    end

    assert_redirected_to media_group_path(assigns(:media_group))
  end

  test "should show media_group" do
    get :show, id: @media_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @media_group
    assert_response :success
  end

  test "should update media_group" do
    patch :update, id: @media_group, media_group: {  }
    assert_redirected_to media_group_path(assigns(:media_group))
  end

  test "should destroy media_group" do
    assert_difference('MediaGroup.count', -1) do
      delete :destroy, id: @media_group
    end

    assert_redirected_to media_groups_path
  end
end

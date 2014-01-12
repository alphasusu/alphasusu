require 'test_helper'

class HeadlinesControllerTest < ActionController::TestCase
  setup do
    @headline = headlines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:headlines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create headline" do
    assert_difference('Headline.count') do
      post :create, headline: { body: @headline.body, title: @headline.title }
    end

    assert_redirected_to headline_path(assigns(:headline))
  end

  test "should show headline" do
    get :show, id: @headline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @headline
    assert_response :success
  end

  test "should update headline" do
    patch :update, id: @headline, headline: { body: @headline.body, title: @headline.title }
    assert_redirected_to headline_path(assigns(:headline))
  end

  test "should destroy headline" do
    assert_difference('Headline.count', -1) do
      delete :destroy, id: @headline
    end

    assert_redirected_to headlines_path
  end
end

require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  setup do
    @article = FactoryGirl.create(:article)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
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

  test "should not create article without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      post :create, article: { body: @article.body, title: @article.title }
    }
  end

  test "should not create article without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      post :create, article: { body: @article.body, title: @article.title }
    }
  end

  test "should create article" do
    as_admin
    assert_difference('Article.count') do
      post :create, article: { body: @article.body, title: @article.title }
    end

    assert_redirected_to article_path(assigns(:article))
  end

  test "should show article" do
    get :show, id: @article
    assert_response :success
  end

  test "should not get edit without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @article
    }
  end

  test "should not get edit without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @article
    }
  end

  test "should get edit" do
    as_admin
    get :edit, id: @article
    assert_response :success
  end

  test "should not update article without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @article, article: { body: @article.body, title: @article.title }
    }
  end

  test "should not update article without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @article, article: { body: @article.body, title: @article.title }
    }
  end

  test "should update article" do
    as_admin
    patch :update, id: @article, article: { body: @article.body, title: @article.title }
    assert_redirected_to article_path(assigns(:article))
  end

  test "should not destroy article without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @article
    }
  end

  test "should not destroy article without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @article
    }
  end

  test "should destroy article" do
    as_admin
    assert_difference('Article.count', -1) do
      delete :destroy, id: @article
    end

    assert_redirected_to articles_path
  end
end

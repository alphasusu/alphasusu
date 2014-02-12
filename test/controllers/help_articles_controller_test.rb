require 'test_helper'

class HelpArticlesControllerTest < ActionController::TestCase
  setup do
    @help_article = FactoryGirl.create(:help_article)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:help_articles)
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

  test "should not create help_article without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      post :create, help_article: { body: @help_article.body, title: @help_article.title }
    }
  end

  test "should not create help_article without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      post :create, help_article: { body: @help_article.body, title: @help_article.title }
    }
  end

  test "should create help_article" do
    as_admin
    assert_difference('HelpArticle.count') do
      post :create, help_article: { body: @help_article.body, title: @help_article.title }
    end

    assert_redirected_to help_article_path(assigns(:help_article))
  end

  test "should show help_article" do
    get :show, id: @help_article
    assert_response :success
  end

  test "should not get edit without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @help_article
    }
  end

  test "should not get edit without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      get :edit, id: @help_article
    }
  end

  test "should get edit" do
    as_admin
    get :edit, id: @help_article
    assert_response :success
  end

  test "should not update help_article without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @help_article, help_article: { body: @help_article.body, title: @help_article.title }
    }
  end

  test "should not update help_article without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      patch :update, id: @help_article, help_article: { body: @help_article.body, title: @help_article.title }
    }
  end

  test "should update help_article" do
    as_admin
    patch :update, id: @help_article, help_article: { body: @help_article.body, title: @help_article.title }
    assert_redirected_to help_article_path(assigns(:help_article))
  end

  test "should not destroy help_article without auth" do
    as_nobody
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @help_article
    }
  end

  test "should not destroy help_article without permission" do
    as_user
    assert_raise(CanCan::AccessDenied) {
      delete :destroy, id: @help_article
    }
  end

  test "should destroy help_article" do
    as_admin
    assert_difference('HelpArticle.count', -1) do
      delete :destroy, id: @help_article
    end

    assert_redirected_to help_articles_path
  end
end

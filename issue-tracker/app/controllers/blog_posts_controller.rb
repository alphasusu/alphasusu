class BlogPostsController < ApplicationController
  def show
    @post = BlogPost.find(params[:id])
  end
  def index
    @posts = BlogPost.all
  end
end

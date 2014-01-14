class BlogPostsController < ApplicationController
  before_action :set_site_area
  
  def show
    @post = BlogPost.friendly.find(params[:id])
  end
  
  def index
    @posts = BlogPost.all
  end
  
  def create
    @post = BlogPost.new(post_params)
    
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def new 
    @post = BlogPost.new
  end

private

  def post_params
    params.require(:blog_post).permit(:title, :body)
  end
end

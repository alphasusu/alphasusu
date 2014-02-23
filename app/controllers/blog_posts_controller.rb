class BlogPostsController < ApplicationController
  authorize_resource
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
  before_action :set_site_area
  
  # GET /blog_posts
  # GET /blog_posts.json
  def index
    @posts = BlogPost.all
  end

  # GET /blog_posts/1
  # GET /blog_posts/1.json
  def show
  end

  # GET /blog_posts/new
  def new
    @post = BlogPost.new
  end

  # GET /blog_posts/1/edit
  def edit
  end

  # POST /blog_posts
  # POST /blog_posts.json
  def create
    @post = BlogPost.new(blog_post_params)
    @post.author = current_user
    create_resource_response(@post)
  end

  # PATCH/PUT /blog_posts/1
  # PATCH/PUT /blog_posts/1.json
  def update
    update_resource_response(@post, blog_post_params)
  end

  # DELETE /blog_posts/1
  # DELETE /blog_posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to blog_posts_url }
      format.json { head :no_content }
    end
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_blog_post
    @post = BlogPost.friendly.find(params[:id])
  end

  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end
end

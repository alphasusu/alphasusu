class HelpArticlesController < ApplicationController
  authorize_resource
  before_action :set_help_article, only: [:show, :edit, :update, :destroy]
  before_action :set_site_area

  def new
    @help_article = HelpArticle.new
  end  

  def create
    @help_article = HelpArticle.new(help_article_params)
    @help_article.slug = @help_article.title.parameterize
    respond_to do |format|
      if @help_article.save
        format.html { redirect_to @help_article, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @help_article }
      else
        format.html { render action: 'new' }
        format.json { render json: @help_article.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private

  def help_article_params
    params.require(:help_article).permit(:title, :body)
  end

  def set_help_article
    @help_article = HelpArticle.friendly.find(params[:id])
  end
  
end

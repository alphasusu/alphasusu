class HelpArticlesController < ApplicationController
  authorize_resource
  before_action :set_help_article, only: [:show, :edit, :update, :destroy]
  before_action :set_site_area

  # GET /help_articles
  # GET /help_articles.json
  def index
    @help_articles = HelpArticle.all
  end

  # GET /help_articles/1
  # GET /help_articles/1.json
  def show
  end

  # GET /help_articles/new
  def new
    @help_article = HelpArticle.new
  end

  # GET /help_articles/1/edit
  def edit
  end

  # POST /help_articles
  # POST /help_articles.json
  def create
    @help_article = HelpArticle.new(help_article_params)

    respond_to do |format|
      if @help_article.save
        format.html { redirect_to @help_article, notice: 'HelpArticle was successfully created.' }
        format.json { render action: 'show', status: :created, location: @help_article }
      else
        format.html { render action: 'new' }
        format.json { render json: @help_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /help_articles/1
  # PATCH/PUT /help_articles/1.json
  def update
    respond_to do |format|
      if @help_article.update(help_article_params)
        format.html { redirect_to @help_article, notice: 'HelpArticle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @help_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /help_articles/1
  # DELETE /help_articles/1.json
  def destroy
    @help_article.destroy
    respond_to do |format|
      format.html { redirect_to help_articles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_help_article
      @help_article = HelpArticle.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def help_article_params
      params.require(:help_article).permit(:title, :body, :slug)
    end
end

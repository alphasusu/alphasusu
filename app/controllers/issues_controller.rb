class IssuesController < ApplicationController
  before_action :set_site_area
  
  def index
    @issues = Issue.all
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def create
    @issue = Issue.new(post_params)
    
    if @issue.save
      redirect_to @issue
    else
      render 'new'
    end
  end

  def new
    @issue = Issue.new
  end

private

  def post_params
    params.require(:issue).permit(:title, :description)
  end

end

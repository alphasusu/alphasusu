class IssuesController < ApplicationController
  def index
    @issues = Issue.all
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def create
    @issue = Issue.new(params[:post])
    
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
    params.require(:post).permit(:title, :description)
  end

end

class CoursesController < ApplicationController
  authorize_resource
  
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create

  end

  def update
  end
  def destroy
  end

end

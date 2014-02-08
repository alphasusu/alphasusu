class CourseRepsController < ApplicationController
  #authorize_resource

  
  def index
    @course_reps = CourseRepresentative.all
  end
end

class CourseRepresentativesController < ApplicationController
  authorize_resource
  before_action :set_course_representative, only: [:show, :edit, :update, :destroy]
  before_action :set_site_area

  # GET /course_representatives
  # GET /course_representatives.json
  def index
    @course_representatives = CourseRepresentative.all
  end

  # GET /course_representatives/1
  # GET /course_representatives/1.json
  def show
  end

  # GET /course_representatives/new
  def new
    @course_representative = CourseRepresentative.new
  end

  # GET /course_representatives/1/edit
  def edit
  end

  # POST /course_representatives
  # POST /course_representatives.json
  def create
    @course_representative = CourseRepresentative.new(course_representative_params)
    create_resource_response(@course_representative)
  end

  # PATCH/PUT /course_representatives/1
  # PATCH/PUT /course_representatives/1.json
  def update
    update_resource_response(@course_representative, course_representative_params)
  end

  # DELETE /course_representatives/1
  # DELETE /course_representatives/1.json
  def destroy
    @course_representative.destroy
    respond_to do |format|
      format.html { redirect_to course_representatives_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_representative
      @course_representative = CourseRepresentative.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_representative_params
      params.require(:course_representative).permit(:user_id, :course_id, :year)
    end
end

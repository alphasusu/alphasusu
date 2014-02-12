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

    respond_to do |format|
      if @course_representative.save
        format.html { redirect_to @course_representative, notice: 'Course Representative was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course_representative }
      else
        format.html { render action: 'new' }
        format.json { render json: @course_representative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_representatives/1
  # PATCH/PUT /course_representatives/1.json
  def update
    respond_to do |format|
      if @course_representative.update(course_representative_params)
        format.html { redirect_to @course_representative, notice: 'Course Representative was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course_representative.errors, status: :unprocessable_entity }
      end
    end
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

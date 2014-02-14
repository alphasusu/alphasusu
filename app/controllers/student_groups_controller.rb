class StudentGroupsController < ApplicationController
  authorize_resource
  before_action :set_student_group, only: [:show, :edit, :update, :destroy]
  before_action :set_site_area

  # GET /student_groups
  # GET /student_groups.json
  def index
    @student_groups = StudentGroup.all
  end

  # GET /student_groups/1
  # GET /student_groups/1.json
  def show
  end

  # GET /student_groups/new
  def new
    @student_group = StudentGroup.new
  end

  # GET /student_groups/1/edit
  def edit
  end

  # POST /student_groups
  # POST /student_groups.json
  def create
    @student_group = StudentGroup.new(student_group_params)
    create_resource_response(@student_group)
  end

  # PATCH/PUT /student_groups/1
  # PATCH/PUT /student_groups/1.json
  def update
    update_resource_response(@student_group, student_group_params)
  end

  # DELETE /student_groups/1
  # DELETE /student_groups/1.json
  def destroy
    @student_group.destroy
    respond_to do |format|
      format.html { redirect_to student_groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_group
      @student_group = StudentGroup.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_group_params
      params.require(:student_group).permit(:name, :description)
    end
    
    def set_site_area
      params[:site_area] = :activities
    end
end

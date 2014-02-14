class StudentGroupKindsController < ApplicationController
  authorize_resource
  before_action :set_student_group_kind, only: [:show, :edit, :update, :destroy]

  # GET /student_group_kinds
  # GET /student_group_kinds.json
  def index
    @student_group_kinds = StudentGroupKind.all
  end

  # GET /student_group_kinds/1
  # GET /student_group_kinds/1.json
  def show
  end

  # GET /student_group_kinds/new
  def new
    @student_group_kind = StudentGroupKind.new
  end

  # GET /student_group_kinds/1/edit
  def edit
  end

  # POST /student_group_kinds
  # POST /student_group_kinds.json
  def create
    @student_group_kind = StudentGroupKind.new(student_group_kind_params)
    create_resource_response(@student_group_kind)
  end

  # PATCH/PUT /student_group_kinds/1
  # PATCH/PUT /student_group_kinds/1.json
  def update
    update_resource_response(@student_group_kind, student_group_kind_params)
  end

  # DELETE /student_group_kinds/1
  # DELETE /student_group_kinds/1.json
  def destroy
    @student_group_kind.destroy
    respond_to do |format|
      format.html { redirect_to student_group_kinds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_group_kind
      @student_group_kind = StudentGroupKind.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_group_kind_params
      params.require(:student_group_kind).permit(:name, :description)
    end
end

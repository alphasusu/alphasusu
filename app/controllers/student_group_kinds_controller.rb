class StudentGroupKindsController < ApplicationController
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

    respond_to do |format|
      if @student_group_kind.save
        format.html { redirect_to @student_group_kind, notice: 'Student group kind was successfully created.' }
        format.json { render action: 'show', status: :created, location: @student_group_kind }
      else
        format.html { render action: 'new' }
        format.json { render json: @student_group_kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_group_kinds/1
  # PATCH/PUT /student_group_kinds/1.json
  def update
    respond_to do |format|
      if @student_group_kind.update(student_group_kind_params)
        format.html { redirect_to @student_group_kind, notice: 'Student group kind was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @student_group_kind.errors, status: :unprocessable_entity }
      end
    end
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

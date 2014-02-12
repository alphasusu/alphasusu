class SocietiesController < ApplicationController
  authorize_resource
  before_action :set_society, only: [:show, :edit, :update, :destroy]
  before_action :set_site_area

  # GET /societies
  # GET /societies.json
  def index
    @societies = Society.all
  end

  # GET /societies/1
  # GET /societies/1.json
  def show
  end

  # GET /societies/new
  def new
    @society = Society.new
  end

  # GET /societies/1/edit
  def edit
  end

  # POST /societies
  # POST /societies.json
  def create
    @society = Society.new(society_params)
    create_resource_response(@society)
  end

  # PATCH/PUT /societies/1
  # PATCH/PUT /societies/1.json
  def update
    update_resource_response(@society, society_params)
  end

  # DELETE /societies/1
  # DELETE /societies/1.json
  def destroy
    @society.destroy
    respond_to do |format|
      format.html { redirect_to societies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_society
      @society = Society.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def society_params
      params.require(:society).permit(:name, :description)
    end
    
    def set_site_area
      params[:site_area] = :activities
    end
end

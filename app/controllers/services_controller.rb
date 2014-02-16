
class ServicesController < ApplicationController
  authorize_resource
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :set_site_area

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    create_resource_response(@service)
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    update_resource_response(@service, service_params)
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :description, :location)
    end
    
    def set_site_area
      params[:site_area] = :services
    end
end

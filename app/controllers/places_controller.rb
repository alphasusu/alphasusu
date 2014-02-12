class PlacesController < ApplicationController
  authorize_resource
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :set_site_area
  
  # GET /places
  # GET /places.json
  def index
    @places = Place.where(shown: true)
    @markers = @places.map do |p|
      { latlng: [p.latitude, p.longitude], id: p.id }
    end
  end

  # GET /places/1
  # GET /places/1.json
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)
    create_resource_response(@place)
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    update_resource_response(@place, place_params)
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name, :description, :latitude, :longitude)
    end
    
    def set_site_area
      params[:site_area] = :places
    end
end

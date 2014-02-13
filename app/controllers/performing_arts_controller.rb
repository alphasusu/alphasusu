class PerformingArtsController < ApplicationController
  authorize_resource
  before_action :set_performing_art, only: [:show, :edit, :update, :destroy]
  before_action :set_site_area

  # GET /performing_arts
  # GET /performing_arts.json
  def index
    @performing_arts = PerformingArt.all
  end

  # GET /performing_arts/1
  # GET /performing_arts/1.json
  def show
  end

  # GET /performing_arts/new
  def new
    @performing_art = PerformingArt.new
  end

  # GET /performing_arts/1/edit
  def edit
  end

  # POST /performing_arts
  # POST /performing_arts.json
  def create
    @performing_art = PerformingArt.new(performing_art_params)

    respond_to do |format|
      if @performing_art.save
        format.html { redirect_to @performing_art, notice: 'Performing art was successfully created.' }
        format.json { render action: 'show', status: :created, location: @performing_art }
      else
        format.html { render action: 'new' }
        format.json { render json: @performing_art.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /performing_arts/1
  # PATCH/PUT /performing_arts/1.json
  def update
    respond_to do |format|
      if @performing_art.update(performing_art_params)
        format.html { redirect_to @performing_art, notice: 'Performing art was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @performing_art.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performing_arts/1
  # DELETE /performing_arts/1.json
  def destroy
    @performing_art.destroy
    respond_to do |format|
      format.html { redirect_to performing_arts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_performing_art
      @performing_art = PerformingArt.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def performing_art_params
      params[:performing_art]
    end

    def set_site_area
      params[:site_area] = :activities
    end
end

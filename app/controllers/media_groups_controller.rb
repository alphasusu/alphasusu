class MediaGroupsController < ApplicationController
  authorize_resource
  before_action :set_media_group, only: [:show, :edit, :update, :destroy]
  before_action :set_site_area

  # GET /media_groups
  # GET /media_groups.json
  def index
    @media_groups = MediaGroup.all
  end

  # GET /media_groups/1
  # GET /media_groups/1.json
  def show
  end

  # GET /media_groups/new
  def new
    @media_group = MediaGroup.new
  end

  # GET /media_groups/1/edit
  def edit
  end

  # POST /media_groups
  # POST /media_groups.json
  def create
    @media_group = MediaGroup.new(media_group_params)

    respond_to do |format|
      if @media_group.save
        format.html { redirect_to @media_group, notice: 'Media group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @media_group }
      else
        format.html { render action: 'new' }
        format.json { render json: @media_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media_groups/1
  # PATCH/PUT /media_groups/1.json
  def update
    respond_to do |format|
      if @media_group.update(media_group_params)
        format.html { redirect_to @media_group, notice: 'Media group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @media_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_groups/1
  # DELETE /media_groups/1.json
  def destroy
    @media_group.destroy
    respond_to do |format|
      format.html { redirect_to media_groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media_group
      @media_group = MediaGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def media_group_params
      params[:media_group]
    end

    def set_site_area
      params[:site_area] = :activities
    end
end

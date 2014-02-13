class ActivitiesController < ApplicationController
  before_action :set_site_area

  def index
    @society_count = Society.count
    @sport_count = Sport.count
    @performing_art_count = PerformingArt.count
    @media_group_count = MediaGroup.count
  end

private

  def set_site_area
    params[:site_area] = :activities
  end
end

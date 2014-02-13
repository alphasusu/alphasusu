class ActivitiesController < ApplicationController
  def index
    @society_count = Society.count
    @sport_count = Sport.count
    @performing_art_count = PerformingArt.count
    @media_group_count = MediaGroup.count
  end
end

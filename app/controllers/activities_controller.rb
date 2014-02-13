class ActivitiesController < ApplicationController
  before_action :set_site_area

  def index
    @society_count = Society.count
    @sport_count = Sport.count
    @performing_art_count = PerformingArt.count
    @media_group_count = MediaGroup.count

    groups = StudentGroup.where.not(logo_file_name: nil)
    groups.shuffle!

    @showcased_groups = groups[0..8]
  end

private

  def set_site_area
    params[:site_area] = :activities
  end
end

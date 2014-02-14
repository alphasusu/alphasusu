class ActivitiesController < ApplicationController
  before_action :set_site_area

  def index
    @sport_count = StudentGroupKind.where(name: "Sport").first.groups.count
    @performing_art_count = StudentGroupKind.where(name: "Performing Art").first.groups.count
    @media_group_count = StudentGroupKind.where(name: "Media").first.groups.count
    @society_count = StudentGroup.count - @sport_count - @performing_art_count - @media_group_count

    groups = StudentGroup.where.not(logo_file_name: nil)
    groups.shuffle!

    @showcased_groups = groups[0..8]
  end

private

  def set_site_area
    params[:site_area] = :activities
  end
end

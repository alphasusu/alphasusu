class ActivitiesController < ApplicationController
  before_action :set_site_area

  def index
    @sport_count = StudentGroupKind.groups_of_type(:sport).count
    @performing_art_count = StudentGroupKind.groups_of_type(:performing_art).count
    @media_group_count = StudentGroupKind.groups_of_type(:media).count
    @society_count = StudentGroupKind.groups_of_type(:society).count
  end

private

  def set_site_area
    params[:site_area] = :activities
  end
end

class ActivitiesController < ApplicationController
  before_action :set_site_area

  def index
    @sport_count = StudentGroupKind.groups_of_type(:sport).count
    @performing_art_count = StudentGroupKind.groups_of_type(:performing_art).count
    @media_group_count = StudentGroupKind.groups_of_type(:media).count
    @society_count = StudentGroupKind.groups_of_type(:society).count

    @groups_json = StudentGroup.all.joins(:kinds).map {|g| { 
		name: g.name,
		description: g.description,
		logo: g.logo.url(:small),
		url: student_group_path(g),
		kinds: g.kinds.map {|k|
    			k.name.pluralize
    	}
    }}.to_json
  end

private

  def set_site_area
    params[:site_area] = :activities
  end
end

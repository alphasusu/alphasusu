class DemocracyController < ApplicationController
  before_action :set_site_area
  skip_authorization_check

  def index
    @president = Officer.where(:title => "Union President")
    @vice_presidents = Officer.where.not(:title => "Union President")
  end

private

    def set_site_area
        params[:site_area] = :democracy
    end

end

class DemocracyController < ApplicationController
  before_action :set_site_area
  skip_authorization_check

  def index
    @vice_presidents = Officer.where.not(:title => "Union President")
  end
end

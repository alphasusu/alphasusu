class HomeController < ApplicationController
  before_action :set_site_area
  skip_authorization_check

  def index
    @headlines = Headline.all
    @posts = BlogPost.find(:all, :limit => 3)
    @events = Event.find(:all, :limit => 5)
    authorize! :read, @headlines
    authorize! :read, @posts
    authorize! :read, @events
  end

  def activities
  end

  def democracy
  end
end

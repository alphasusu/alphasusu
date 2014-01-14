class HomeController < ApplicationController
  before_action :set_site_area
  
  def index
    @headlines = Headline.all
    @posts = BlogPost.find(:all, :limit => 3)
    @events = Event.find(:all, :limit => 5)
  end

  def activities
  end

  def democracy
  end
end

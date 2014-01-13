class HomeController < ApplicationController
  def index
    @headlines = Headline.all
    @posts = BlogPost.find(:all, :limit => 3)
    @events = Event.all
  end

  def activities
  end

  def democracy
  end
end

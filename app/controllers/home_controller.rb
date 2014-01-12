class HomeController < ApplicationController
  def index
    @headlines = Headline.all
    @posts = BlogPost.all
    @events = Event.all
  end

  def activities
  end

  def democracy
  end
end

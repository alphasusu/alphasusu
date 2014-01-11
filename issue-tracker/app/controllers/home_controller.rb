class HomeController < ApplicationController

	def index
          @posts = BlogPost.all
          @events = Event.all
	end
	
end

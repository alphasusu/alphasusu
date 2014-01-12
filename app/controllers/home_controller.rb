class HomeController < ApplicationController

	def index
        @posts = BlogPost.all
        @events = Event.all

        if not cookies.permanent[:returning_user]
        	@first_visit = true
        	cookies.permanent[:returning_user] = true
        end
	end
	
end

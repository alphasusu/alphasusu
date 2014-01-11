class HomeController < ApplicationController

	def index
          @posts = BlogPost.all
	end
	
end

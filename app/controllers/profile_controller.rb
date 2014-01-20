class ProfileController < ApplicationController
	before_filter :require_login, except: [ :show ]
	rescue_from ActiveRecord::RecordNotFound, with: :user_not_found
  
	def show
	  	@profile = User.find(params[:id])
	end
  	
	def me
		@profile = current_user
		render :show
	end
  
  	def edit
	  	@profile = current_user
	end
	
	def update
		
	end
  
private
  
  	def post_params
  		params.require(:profile).permit(:first_name, :last_name, :email, :avatar)
  	end
  	
  	def user_not_found
		render text: "User Not Found", status: 404  	
	end
	
end

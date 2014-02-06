class ProfilesController < ApplicationController
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
		@profile = User.find(params[:id])
		
		@profile.first_name = params[:profile][:first_name]
		@profile.last_name = params[:profile][:last_name]
		
		if @profile.save!
			redirect_to profile_path, notice: 'Profile successfully updated.'
		else
			flash.now[:alert] = 'Could not save your profile.'
			render action: 'edit'
		end
	end
	
	def destroy
		
	end
  
private
  
  	def profile_params
  		params.require(:profile).permit(
  			:first_name, :last_name, :email, :avatar,
  			:password, :password_confirmation, :current_password)
  	end
  	
  	def user_not_found
		render text: "User Not Found", status: 404  	
	end
	
end

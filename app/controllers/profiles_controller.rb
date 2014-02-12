class ProfilesController < ApplicationController
    before_filter :require_login, except: [ :show ]
    before_action :set_profile, only: [:show, :edit, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :user_not_found
    
    def show
        @positions = Officer.where(user: @profile)
    end
        
    def me
        @profile = current_user
        @positions = Officer.where(user: @profile)
        render :show
    end
    
    def edit
        authorize! :update, @profile
    end
    
    def update
        authorize! :update, @profile
        
        @profile.first_name = profile_params[:first_name]
        @profile.last_name = profile_params[:last_name]
        @profile.course_id = profile_params[:course_id]
        @profile.year = profile_params[:year]

        if profile_params[:avatar]
            @profile.avatar = profile_params[:avatar]
        end

        update_email

        success = @profile.save!
        success = update_password

        if success
            redirect_to profile_path, notice: 'Profile successfully updated.'
        else
            flash.now[:alert] = 'Could not save your profile.'
            render action: 'edit'
        end
    end
    
    def destroy
        authorize! :destroy, @profile

        @profile.destroy
        respond_to do |format|
            format.html { redirect_to new_session_path }
            format.json { head :no_content }
        end
    end
    
private

    def set_profile
        @profile = User.find(params[:id])
    end
    
    def profile_params
        params.require(:profile).permit(
            :first_name, :last_name, :email, :avatar, :course_id, :year,
            :password, :password_confirmation, :current_password)
    end
        
    def user_not_found
        render text: "User Not Found", status: 404
        # raise ActionController::RoutingError.new('Not Found')
        # TODO: make a 'user_not_found' route/view etc, use this for a good 404.
    end

    def update_email
        if @profile.is_a?(LocalUser) && profile_params[:email] != @profile.email
            @profile.email = profile_params[:email]
        end
    end

    def update_password
        success = true
        if @profile.is_a?(LocalUser) && !profile_params[:password].blank?
            success = @profile.update_with_password({
                :current_password => profile_params[:current_password],
                :password => profile_params[:password],
                :password_confirmation => profile_params[:password_confirmation]
            })

            if success
                sign_in :local_user, @profile, :bypass => true
            end
        end
        success
    end
    
end

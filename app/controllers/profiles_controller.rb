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

        updates = profile_params
        
        @profile.first_name = updates[:first_name]
        @profile.last_name = updates[:last_name]
        @profile.course_id = updates[:course_id]
        @profile.year = updates[:year]

        if updates[:avatar]
            @profile.avatar = updates[:avatar]
        end

        if @profile.is_a?(LocalUser) && updates[:email] != @profile.email
            @profile.email = updates[:email]
        end

        success = @profile.save!

        if @profile.is_a?(LocalUser) && !updates[:password].blank?
            success = @profile.update_with_password({
                :current_password => updates[:current_password],
                :password => updates[:password],
                :password_confirmation => updates[:password_confirmation]
            })

            if success
                sign_in :local_user, @profile, :bypass => true
            end
        end

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
    
end

class ProfilesController < ApplicationController
    before_filter :require_login, except: [ :show ]
    rescue_from ActiveRecord::RecordNotFound, with: :user_not_found
    
    def show
        @profile = User.find(params[:id])
      @positions = Officer.where(user: @profile)
    end
        
    def me
        @profile = current_user
        render :show
    end
    
    def edit
        @profile = current_user
    end
    
    def update
        updates = profile_params
        @profile = User.find(params[:id])
        
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
        
    end
    
private
    
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

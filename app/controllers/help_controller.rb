class HelpController < ApplicationController
    before_action :set_site_area
    before_filter :require_login, except: [ :index ]

    def index
        @articles = HelpArticle.all
        if logged_in? && current_user.course && !current_user.year.blank?
            @course_reps = current_user.get_course_representatives
            @academic_president = current_user.get_academic_president
            @faculty_officer = current_user.get_faculty_officer
            
            @support_teams = SupportTeam.all
        end
    end

    def chat
        @chat_id = SecureRandom.hex 32
        chat = {
            "id" => @chat_id,
            "group" => params[:group]
        }
        Thread.new {
            Net::HTTP.post_form(URI("http://localhost:4000/"), chat)
        }
    end

    def support
        @roles = current_user.support_teams
    end

    def support_chat
        @chat_id = params[:chat_id]
        @support_groups = [
            "sabbs",
            "susu_support",
            "nightline",
            "course_rep"
        ]
        render :layout => "basic"
    end

private

    def set_site_area
        params[:site_area] = :help
    end
end

class HelpController < ApplicationController
    before_action :set_site_area
    before_filter :require_login, except: [ :index ]

    def index
        @articles = HelpArticle.all
        if logged_in?
            @course_reps = current_user.course.course_representatives.where(year: current_user.year)
            @academic_president = current_user.course.academic_unit.academic_president
            @faculty_officer = current_user.course.academic_unit.faculty.faculty_officer

            # @representatives = @course_reps.concat [@academic_president, @faculty_officer]
            
            @support_groups = [
                { :code => "sabbs",
                  :name => "Sabbs",
                  :description => "Talk to the Sabbs about things that matter to you." },
                { :code => "susu_support",
                  :name => "SUSU Support",
                  :description => "Get help from SUSU staff members who can answer your questions." },
                { :code => "nightline",
                  :name => "Nightline",
                  :description => "Get support from a fellow student, anonymously and confidentially." },
                { :code => "course_rep",
                  :name => "Course Representatives",
                  :description => "Talk to someone about issues on your course, or in your department." }
            ]
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

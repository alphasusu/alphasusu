class HelpController < ApplicationController
    before_action :set_site_area
    before_filter :require_login, except: [ :index ]

    def index
        @articles = Article.all

        # current_user.course.representative

        if logged_in?
            @support_groups = [
                "sabbs",
                "susu_support",
                "nightline",
                "course_rep"
            ]
        end
    end

    def chat
    end

private

    def set_site_area
        params[:site_area] = :help
    end
end

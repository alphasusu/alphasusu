class AdminController < ApplicationController
    
    def index
        # @resources = [
        #     :article,
        #     :contact_element,
        #     :issue,
        #     :tag,
        #     :tag_link,
        # ]
        @resources = {
            :university => [
                :course,
                :academic_unit,
                :faculty,
                :course_representative,
                :academic_president,
                :faculty_officer,
                :create_course_representation,
            ],
            :democracy => [
                :officer,
                :subcommittee,
                :committee_membership,
                :zone,
                :blog_post,
            ],
            :places => [
                :place,
                :schedule,
                :opening_time,
                :menu,
                :menu_category,
                :menu_item,
            ],
            :events => [
                :event,
            ],
            :activities => [
                :student_groups,
            ],
            :services => [
                :service,
            ],
            :site => [
                :headline,
                :ability,
                :permission,
            ],
            :help => [
                :help_article,
                :support_team,
                :message,
            ],
            :users => [
                :user,
                :ldap_user,
                :local_user,
            ],
        }
    end

end

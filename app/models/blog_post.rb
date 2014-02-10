class BlogPost < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged
    belongs_to :author, class_name: "User", foreign_key: "user_id"
	
end

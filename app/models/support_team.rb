class SupportTeam < ActiveRecord::Base
    has_and_belongs_to_many :users
    
    has_attached_file(
        :logo,
        :styles => { :small => "40x40>", :medium => "100x100>", :large => "300x300" },
        :path => ":rails_root/public/system/:class/:attachment/:id/:style/:basename.:extension",
        :url => "/system/:class/:attachment/:id/:style/:basename.:extension"
    )

    validates_attachment :logo, :size => { :in => 0..200.kilobytes }
    validates_attachment_content_type :logo, :content_type => %w(image/jpeg image/jpg image/png)
end

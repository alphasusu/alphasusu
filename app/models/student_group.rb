class StudentGroup < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :student_groups_and_kinds
  has_many :kinds, class_name: "StudentGroupKind", through: :student_groups_and_kinds

  has_attached_file(
    :logo,
    :styles => { :small => "100x100>", :medium => "200x200>", :large => "300x300" },
    :path => ":rails_root/public/system/:class/:attachment/:id/:style/:basename.:extension",
    :url => "/system/:class/:attachment/:id/:style/:basename.:extension",
    :default_url => "/susu_logo.png",
  )
    
  validates_attachment :logo, :size => { :in => 0..5.megabytes }
  validates_attachment_content_type :logo, :content_type => %w(image/jpeg image/jpg image/png image/gif)

end

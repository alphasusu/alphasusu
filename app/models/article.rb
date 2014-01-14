class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  has_many :tag_links
  has_many :tags, :through => :tag_links
end

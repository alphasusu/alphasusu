class Tag < ActiveRecord::Base
  has_many :tag_links
  has_many :articles, :through => :tag_links
end

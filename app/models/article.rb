class Article < ActiveRecord::Base
  has_many :tag_links
  has_many :tags, :through => :tag_links
end

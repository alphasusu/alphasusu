class Menu < ActiveRecord::Base
  belongs_to :place
  has_many :menu_categories
  has_many :menu_items, :through => :menu_categories
end

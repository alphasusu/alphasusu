class Service < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_many :opening_times
  has_many :contact_elements
end

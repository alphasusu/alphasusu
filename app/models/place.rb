class Place < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_one :schedule
  has_many :events
end

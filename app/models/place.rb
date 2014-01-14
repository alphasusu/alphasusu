class Place < ActiveRecord::Base
  has_one :schedule
  has_one :menu
  has_many :events
end

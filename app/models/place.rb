class Place < ActiveRecord::Base
  has_one :schedule
  has_many :events
end

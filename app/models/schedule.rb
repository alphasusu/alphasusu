class Schedule < ActiveRecord::Base
  belongs_to :place
  has_many :opening_time
end

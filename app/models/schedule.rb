class Schedule < ActiveRecord::Base
  belongs_to :place
  has_many :opening_times
end

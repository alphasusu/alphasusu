class Course < ActiveRecord::Base
  belongs_to :faculty
  has_many :cohorts
end

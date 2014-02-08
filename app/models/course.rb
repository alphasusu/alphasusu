class Course < ActiveRecord::Base
  has_many :course_representatives
  belongs_to :academic_unit
end

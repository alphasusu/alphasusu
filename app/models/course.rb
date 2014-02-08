class Course < ActiveRecord::Base
  has_many :course_representations
  has_many :course_representatives, through: :course_representations
end

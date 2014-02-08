class CourseRepresentation < ActiveRecord::Base
  belongs_to :course
  belongs_to :course_representative
end

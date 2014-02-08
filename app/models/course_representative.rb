class CourseRepresentative < Officer
  has_many :course_representations
  has_many :courses, through: :course_representations
end

class CourseRepresentative < Officer
  has_many :courses, through: :course_representations
end

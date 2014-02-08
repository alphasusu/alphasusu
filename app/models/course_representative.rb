class CourseRepresentative < Officer
  belongs_to :course
  belongs_to :user
end

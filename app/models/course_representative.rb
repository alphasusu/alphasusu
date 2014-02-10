class CourseRepresentative < Officer
  belongs_to :course
  belongs_to :user

  def position_name
    "Course Rep - " + self.course.name
  end
end

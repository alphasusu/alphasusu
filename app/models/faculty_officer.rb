class FacultyOfficer < Officer
  belongs_to :faculty

  def position_name
    "Faculty Officer - " + self.faculty.name
  end
end

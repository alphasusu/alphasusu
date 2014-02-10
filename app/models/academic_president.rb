class AcademicPresident < Officer
  belongs_to :academic_unit
  
  def position_name
    "Academic President - " + self.academic_unit.name
  end
end

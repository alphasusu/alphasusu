class AddAcademicUnitIdToCourses < ActiveRecord::Migration
  def change
    add_reference :courses, :academic_unit, index: true
  end
end

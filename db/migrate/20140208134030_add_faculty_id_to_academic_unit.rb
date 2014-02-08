class AddFacultyIdToAcademicUnit < ActiveRecord::Migration
  def change
    add_reference :academic_units, :faculty, index: true
  end
end

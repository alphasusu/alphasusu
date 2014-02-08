class AddAcademicUnitIdToOfficer < ActiveRecord::Migration
  def change
    add_reference :officers, :academic_unit, index: true
  end
end

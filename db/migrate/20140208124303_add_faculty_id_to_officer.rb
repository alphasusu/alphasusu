class AddFacultyIdToOfficer < ActiveRecord::Migration
  def change
    add_reference :officers, :faculty, index: true
  end
end

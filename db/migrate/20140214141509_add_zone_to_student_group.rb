class AddZoneToStudentGroup < ActiveRecord::Migration
  def change
    add_reference :student_groups, :zone
  end
end

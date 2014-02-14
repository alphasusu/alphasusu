class AddIndexToStudentGroupKind < ActiveRecord::Migration
  def change
    add_index :student_group_kinds, :name, :unique => true
  end
end

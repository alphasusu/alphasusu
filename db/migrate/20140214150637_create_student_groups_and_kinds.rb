class CreateStudentGroupsAndKinds < ActiveRecord::Migration
  def change
    create_table :student_groups_and_kinds do |t|
        t.belongs_to :student_group
        t.belongs_to :student_group_kind
    end
  end
end

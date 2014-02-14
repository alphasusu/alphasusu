class CreateStudentGroupKinds < ActiveRecord::Migration
  def change
    create_table :student_group_kinds do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

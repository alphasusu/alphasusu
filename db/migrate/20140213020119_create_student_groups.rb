class CreateStudentGroups < ActiveRecord::Migration
  def change
    create_table :student_groups do |t|
      t.string :name
      t.string :slug
      t.string :description
      t.string :type

      t.timestamps
    end
  end
end

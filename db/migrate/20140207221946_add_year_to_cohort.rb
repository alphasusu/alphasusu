class AddYearToCohort < ActiveRecord::Migration
  def change
    add_column :cohorts, :year, :int
    add_index :cohorts, [:year, :course_id], :unique => true
  end
end

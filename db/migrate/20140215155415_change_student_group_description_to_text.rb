class ChangeStudentGroupDescriptionToText < ActiveRecord::Migration
  def change
    change_column :student_groups, :description, :text, :limit => nil
  end
end

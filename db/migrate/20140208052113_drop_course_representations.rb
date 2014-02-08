class DropCourseRepresentations < ActiveRecord::Migration
  def change
    drop_table :course_representations
  end
end

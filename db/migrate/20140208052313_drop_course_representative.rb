class DropCourseRepresentative < ActiveRecord::Migration
  def change
    drop_table :course_representatives
  end
end

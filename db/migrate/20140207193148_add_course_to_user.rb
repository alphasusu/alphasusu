class AddCourseToUser < ActiveRecord::Migration
  def change
    add_reference :users, :course, index: true
  end
end

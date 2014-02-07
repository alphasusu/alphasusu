class AddFacultyToCourse < ActiveRecord::Migration
  def change
    add_reference :courses, :faculty, index: true
  end
end

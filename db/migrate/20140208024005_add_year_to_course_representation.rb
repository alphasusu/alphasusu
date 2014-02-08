class AddYearToCourseRepresentation < ActiveRecord::Migration
  def change
    add_column :course_representations, :year, :int
  end
end

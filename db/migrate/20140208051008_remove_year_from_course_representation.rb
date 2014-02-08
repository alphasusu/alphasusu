class RemoveYearFromCourseRepresentation < ActiveRecord::Migration
  def change
    remove_column :course_representations, :year, :string
  end
end

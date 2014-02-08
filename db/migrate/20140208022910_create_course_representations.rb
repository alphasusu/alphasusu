class CreateCourseRepresentations < ActiveRecord::Migration
  def change
    create_table :course_representations do |t|
      t.references :course, index: true
      t.references :course_representative, index: true

      t.timestamps
    end
  end
end

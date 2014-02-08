class CreateCourseRepresentatives < ActiveRecord::Migration
  def change
    create_table :course_representatives do |t|
      t.references :user, index: true
      t.references :course, index: true
      t.string :year
    end
  end
end

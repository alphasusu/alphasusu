class AddCourseToCohort < ActiveRecord::Migration
  def change
    add_reference :cohorts, :course, index: true
  end
end

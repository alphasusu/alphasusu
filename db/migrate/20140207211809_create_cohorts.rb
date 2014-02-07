class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|

      t.timestamps
    end
  end
end

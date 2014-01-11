class CreateOpeningTimes < ActiveRecord::Migration
  def change
    create_table :opening_times do |t|
      t.boolean :vacation
      t.integer :day
      t.integer :open
      t.integer :close

      t.timestamps
    end
  end
end

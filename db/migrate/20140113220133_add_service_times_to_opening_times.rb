class AddServiceTimesToOpeningTimes < ActiveRecord::Migration
  def change
    add_column :opening_times, :service_start, :integer
    add_column :opening_times, :service_end, :integer
  end
end

class AddScheduleIdToOpeningTimes < ActiveRecord::Migration
  def change
    add_column :opening_times, :schedule_id, :integer
  end
end

class RemoveServiceIdFromOpeningTimes < ActiveRecord::Migration
  def change
    remove_column :opening_times, :service_id
  end
end

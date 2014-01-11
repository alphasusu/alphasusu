class AddServiceIdtoOpeningTime < ActiveRecord::Migration
  def change
    add_column :opening_times, :service_id, :integer
  end
end

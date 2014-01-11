class AddServiceIdtoContactElement < ActiveRecord::Migration
  def change
    add_column :contact_elements, :service_id, :integer
  end
end

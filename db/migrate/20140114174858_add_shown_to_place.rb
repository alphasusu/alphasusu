class AddShownToPlace < ActiveRecord::Migration
  def change
    add_column :places, :shown, :boolean
  end
end

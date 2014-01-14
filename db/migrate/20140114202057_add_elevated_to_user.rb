class AddElevatedToUser < ActiveRecord::Migration
  def change
    add_column :users, :elevated, :boolean
  end
end

class RemoveLoginFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :login
  end
end

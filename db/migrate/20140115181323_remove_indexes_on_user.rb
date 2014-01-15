class RemoveIndexesOnUser < ActiveRecord::Migration
  def change
    remove_index :users, column: :email
    remove_index :users, column: :login
  end
end

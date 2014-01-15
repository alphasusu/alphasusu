class AddEmailIndexOnUser < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, { :null => false, :default => "" }
    add_index :users, :email, :unique => true
  end
end

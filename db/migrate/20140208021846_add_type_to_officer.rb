class AddTypeToOfficer < ActiveRecord::Migration
  def change
    add_column :officers, :type, :string
  end
end

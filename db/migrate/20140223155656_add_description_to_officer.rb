class AddDescriptionToOfficer < ActiveRecord::Migration
  def change
    add_column :officers, :description, :text
  end
end

class AddColumnsToOfficers < ActiveRecord::Migration
  def change
    add_reference :officers, :course, index: true
    add_column :officers, :year, :string
  end
end

class AddNameToAcademicUnits < ActiveRecord::Migration
  def change
    add_column :academic_units, :name, :string
  end
end

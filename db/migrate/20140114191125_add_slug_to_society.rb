class AddSlugToSociety < ActiveRecord::Migration
  def change
    add_column :societies, :slug, :string
    add_index :societies, :slug, unique: true
  end
end

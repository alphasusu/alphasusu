class AddSlugToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :slug, :string
    add_index :issues, :slug, unique: true
  end
end

class CreateMenuCategories < ActiveRecord::Migration
  def change
    create_table :menu_categories do |t|
      t.string :name
      t.references :menu, index: true

      t.timestamps
    end
  end
end

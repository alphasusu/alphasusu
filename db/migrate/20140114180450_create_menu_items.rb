class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.decimal :price, :precision => 8, :scale =>2
      t.text :description
      t.text :additional_info

      t.timestamps
    end
  end
end

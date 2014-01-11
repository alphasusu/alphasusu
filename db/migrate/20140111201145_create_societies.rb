class CreateSocieties < ActiveRecord::Migration
  def change
    create_table :societies do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end

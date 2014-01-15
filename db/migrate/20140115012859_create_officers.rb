class CreateOfficers < ActiveRecord::Migration
  def change
    create_table :officers do |t|
      t.string :title
      t.references :user, index: true

      t.timestamps
    end
  end
end

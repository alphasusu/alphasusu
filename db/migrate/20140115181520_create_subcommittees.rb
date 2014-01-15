class CreateSubcommittees < ActiveRecord::Migration
  def change
    create_table :subcommittees do |t|
      t.text :name
      t.references :zone, index: true

      t.timestamps
    end
  end
end

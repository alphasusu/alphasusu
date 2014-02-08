class CreateSupportTeams < ActiveRecord::Migration
  def change
    create_table :support_teams do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end

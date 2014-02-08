class CreateSupportTeamsUsersJoinTable < ActiveRecord::Migration
  def self.up
    create_table :support_teams_users, :id => false do |t|
      t.integer :user_id
      t.integer :support_team_id
    end

    add_index :support_teams_users, [:user_id, :support_team_id]
  end

  def self.down
    drop_table :support_teams_users
  end
end

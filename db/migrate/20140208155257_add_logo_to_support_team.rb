class AddLogoToSupportTeam < ActiveRecord::Migration
  def up
    add_attachment :support_teams, :logo
  end

  def down
    remove_attachment :support_teams, :logo
  end
end

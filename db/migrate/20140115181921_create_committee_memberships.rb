class CreateCommitteeMemberships < ActiveRecord::Migration
  def change
    create_table :committee_memberships do |t|
      t.references :officer, index: true
      t.references :subcommittee, index: true

      t.timestamps
    end
  end
end

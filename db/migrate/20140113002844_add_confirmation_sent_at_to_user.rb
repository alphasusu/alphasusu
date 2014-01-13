class AddConfirmationSentAtToUser < ActiveRecord::Migration
  def change
    add_column :users, :confirmation_sent_at, :datetime
  end
end

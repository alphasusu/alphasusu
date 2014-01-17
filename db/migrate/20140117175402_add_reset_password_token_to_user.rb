class AddResetPasswordTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :reset_password_token, :string
  end
end

class AddUserToBlogPost < ActiveRecord::Migration
  def change
    add_column :blog_posts, :user_id, :integer
  end
end

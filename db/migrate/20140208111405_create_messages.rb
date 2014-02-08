class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.string :body

      t.belongs_to :from_user, :class_name => "User"
      t.belongs_to :to_user, :class_name => "User"

      t.timestamps
    end
  end
end

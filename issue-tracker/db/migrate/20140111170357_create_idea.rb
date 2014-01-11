class CreateIdea < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :type
      t.string :title
      t.string :description
    end
  end
end

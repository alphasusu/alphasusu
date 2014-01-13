class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
    end

    create_table :tag_links do |t|
      t.belongs_to :article
      t.belongs_to :tag
    end
  end
end

class CreateContactElements < ActiveRecord::Migration
  def change
    create_table :contact_elements do |t|
      t.string :type
      t.string :value

      t.timestamps
    end
  end
end

class AddAttachmentLogoToStudentGroups < ActiveRecord::Migration
  def self.up
    change_table :student_groups do |t|
      t.attachment :logo
    end
  end

  def self.down
    drop_attached_file :student_groups, :logo
  end
end

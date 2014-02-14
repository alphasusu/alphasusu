class StudentGroupsAndKind < ActiveRecord::Base
    belongs_to :groups, class_name: "StudentGroup", foreign_key: :student_group_id
    belongs_to :kinds, class_name: "StudentGroupKind", foreign_key: :student_group_kind_id
end
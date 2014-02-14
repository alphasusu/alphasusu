class StudentGroupKind < ActiveRecord::Base
    has_many :student_groups_and_kinds
    has_many :groups, class_name: "StudentGroup", through: :student_groups_and_kinds
end

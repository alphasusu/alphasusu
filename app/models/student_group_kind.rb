class StudentGroupKind < ActiveRecord::Base
    has_many :student_groups_and_kinds
    has_many :groups, class_name: "StudentGroup", through: :student_groups_and_kinds

    def self.groups_of_type(type)
        kind = self.where(name: type.to_s.split("_").collect(&:capitalize).join(" ")).first
        if kind
            kind.groups
        else
            []
        end
    end

end

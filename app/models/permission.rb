class Permission < ActiveRecord::Base
    belongs_to :user

    def description
        if self.subject_id
            subject = self.subject_class.constantize.find(self.subject_id)
            "#{self.user.name} can #{self.action} #{subject.name}"
        else
            "#{self.user.name} can #{self.action} #{self.subject_class.pluralize}"
        end
    end

end

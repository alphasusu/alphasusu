class AcademicUnit < ActiveRecord::Base
  belongs_to :faculty
  has_one :academic_president
  has_many :course
end

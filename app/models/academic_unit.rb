class AcademicUnit < ActiveRecord::Base
  belongs_to :faculty
  has_many :course
end

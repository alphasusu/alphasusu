class Faculty < ActiveRecord::Base
  has_many :academic_unit
  has_one :faculty_officer
end

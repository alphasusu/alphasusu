class Course < ActiveRecord::Base
  has_one :representative, class_name: "User"
  has_many :students, class_name: "User"
end

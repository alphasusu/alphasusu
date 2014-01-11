class Service < ActiveRecord::Base
  has_many :opening_times
  has_many :contact_elements
end

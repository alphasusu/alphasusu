class Subcommittee < ActiveRecord::Base
  belongs_to :zone
  has_many :committee_memberships
  has_many :officers, :through => :committee_memberships
end

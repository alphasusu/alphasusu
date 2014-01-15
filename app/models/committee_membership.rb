class CommitteeMembership < ActiveRecord::Base
  belongs_to :officer
  belongs_to :subcommittee
end

class Officer < ActiveRecord::Base
  belongs_to :user
  has_many :committee_memberships
  has_many :subcommittees, :through => :committee_memberships

  def position_name
    self.title
  end
end

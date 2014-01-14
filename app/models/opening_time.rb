class OpeningTime < ActiveRecord::Base
  belongs_to :schedule
  
  def has_same_times(opening_time)
    self.open == opening_time.open && self.close == opening_time.close
  end
end

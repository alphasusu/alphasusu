class OpeningTime < ActiveRecord::Base
  belongs_to :schedule
  
  def has_same_times(opening_time)
    self.open == opening_time.open && self.close == opening_time.close
  end
  
  def has_same_service(opening_time)
    self.service_start == opening_time.service_start && self.service_end == opening_time.service_end
  end
end

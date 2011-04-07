class ParttimeTicket < Ticket

  before_create :defaults

  def defaults
    self.is_halfday = false
    self.days_left = day_count
  end


  def self.update_status(date)
    self.update_all("in_use = 0, is_valid = 0", "in_use = 1 AND is_valid = 1 AND days_left = 0 AND in_use_date < '#{date}'");
    self.update_all("in_use = 0", "in_use = 1 AND is_valid = 1 AND days_left > 0 AND in_use_date < '#{date}'");
  end
    
  def use
    if self.is_valid and !self.in_use
      self.days_left -= 1
      self.in_use_date = Date.today
      self.save
    end
    super
  end
  
  
end

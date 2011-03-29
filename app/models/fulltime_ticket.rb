class FulltimeTicket < Ticket

  def self.update_status(date)
    self.update_all("in_use = 0, is_valid = 0", "in_use = 1 AND is_valid = 1 AND last_date < '#{date}'");
  end
  
  
  def use
    if self.is_valid
      self.first_date = Date.today
      self.last_date = Date.today + 1.month
    else
      false
    end
    super

  end
  
  
  
end

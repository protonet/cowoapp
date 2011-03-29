class ParttimeTicket < Ticket

  before_create :defaults

  def defaults
    self.is_halfday = false
    self.days_left = day_count
  end
  
  
  def use
    if is_valid and !in_use
      --days_left
      self.save
    end
    super
  end
  
  
end

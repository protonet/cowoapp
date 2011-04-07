class Ticket < ActiveRecord::Base
  belongs_to  :creator, :class_name => "User", :foreign_key => "creator_id"
  belongs_to  :user

  def before
    self.creator_id = 1
  end
    
  def use
    if self.is_valid
      self.in_use = 1
      self.in_use_date = Date.today
      self.save
      
      TicketLog.ticket_use(self)
    else
      false
    end
  end

  def self.update_status(date = Date.today)
    FulltimeTicket.update_status(date)
    ParttimeTicket.update_status(date)
  end
  
end

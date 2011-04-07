class User < ActiveRecord::Base
  has_many  :created_tickets, :class_name => "Ticket", :foreign_key => "created_id"
  has_many  :tickets
  
  
  def internet_allowed
    t = current_valid_ticket
    if t != nil
      TicketLog.check(t)
      true
    else
      false
    end
  end
  
  def current_valid_ticket()
    tickets.where("in_use = 1 AND is_valid = 1").first;
  end
  
  
end

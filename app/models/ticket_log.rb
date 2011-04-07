class TicketLog < ActiveRecord::Base
  
  def self.create_with_ticket(t)
    ticket_log = create
    ticket_log.user_id = t.user_id
    ticket_log.ticket_id = t.id
    ticket_log.ip = "request.remote_ip"
    ticket_log.mac = "MAC of Computer"
    ticket_log.device_name = "NAme of Computer"
    
    ticket_log
  end
  
  def self.ticket_use(ticket)
    ticket_log = create_with_ticket(ticket)
    ticket_log.usage = "use"
    ticket_log.save
  end
  
  def self.check(ticket)
    ticket_log = create_with_ticket(ticket)
    ticket_log.usage = "check"
    ticket_log.save
  end
end

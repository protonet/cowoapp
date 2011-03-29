require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "ticket" do
    user = User.find_by_name("vikas")
    assert !Ticket.current_valid_ticket(user).first

    ticket = ParttimeTicket.new
    ticket.day_count = 5
    ticket.user_id = user.id
    ticket.creator_id = user.id
    
    assert ticket.save
    # assert ParttimeTicket.all().first
    # 
    # 

    ticket = FulltimeTicket.find(:first)
    assert ticket.use

    # assert ticket.day_count == 4
    
    Ticket.update_status(Date.today + 1.month + 1.day)
    
    puts FulltimeTicket.find(:first).inspect
    
    assert !FulltimeTicket.find(:first).is_valid
    
    
  end
end

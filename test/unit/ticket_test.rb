require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "full time ticket" do
    user = User.find_by_name("vikas")
    assert !user.current_valid_ticket

    ticket = FulltimeTicket.new
    ticket.user_id = user.id
    ticket.creator_id = user.id
    
    assert ticket.save

    ticket = FulltimeTicket.find(:first)
    
    assert !user.internet_allowed
    assert ticket.use
    assert user.internet_allowed
    
    assert FulltimeTicket.find(:first).is_valid
    Ticket.update_status(Date.today + 1.month + 1.day)
    assert !FulltimeTicket.find(:first).is_valid
    assert !user.internet_allowed
  end

  test "ticket_parttime" do
    user = User.find_by_name("vikas")
    
    # no ticket and user should not able to go online.
    assert  !user.internet_allowed
    
    assert TicketLog.all.count == 0
    
    ticket = ParttimeTicket.new
    ticket.day_count = 5
    ticket.user_id = user.id
    ticket.creator_id = user.id
    
    ticket.save
      
    ticket = ParttimeTicket.all.last
      
    assert ticket.day_count == 5
        
    # no ticket should be in use
    assert user.current_valid_ticket == nil
    
    # user can not go online yet
    assert !user.internet_allowed
    assert TicketLog.all.count == 0
    
    ticket.use
    assert user.current_valid_ticket == ticket
    assert TicketLog.all.count == 1
            
    # user is allowed to go online
    assert user.internet_allowed
    assert TicketLog.all.count == 2
      
    assert ticket.days_left == 4
    assert ticket.in_use
    
    # use on same day
    ticket.use
    assert ticket.days_left == 4
    assert user.internet_allowed
    
    # use on diffrent day
    Ticket.update_status(Date.today + 1.month + 1.day)
    assert user.current_valid_ticket == nil
    
    # first check user shouldn't be able to go online
    assert !user.internet_allowed
    
    # refresh from database / ticket has changed.
    assert ticket.reload
    assert ticket.use
      
    assert user.current_valid_ticket == ticket
    
    assert ticket.in_use
    assert ticket.days_left == 3
    assert ticket.is_valid
    
    assert user.internet_allowed
  end

end

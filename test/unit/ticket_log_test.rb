require 'test_helper'

class TicketLogTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "logging of ticket usage" do
    assert TicketLog.all == []
    
    t = ParttimeTicket.find(:first)    
    t.use
    
    assert TicketLog.all.count == 1
    assert TicketLog.find(:first).usage == "use"
    assert TicketLog.find(:first).ticket_id == t.id
    assert TicketLog.find(:first).user_id == t.user.id
    
    TicketLog.check(t)
    assert TicketLog.all.count == 2
    assert TicketLog.find(:last).usage == "check"
    assert TicketLog.find(:last).user_id == t.user.id

   # puts TicketLog.find(:last).inspect
  end
end

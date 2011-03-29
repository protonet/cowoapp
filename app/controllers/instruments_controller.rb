class InstrumentsController < ApplicationController

  def index
    @user = current_user
    @tickets = current_user.tickets
    
    @current_ticket = Ticket.current_valid_ticket(current_user)
     
  end
  
end

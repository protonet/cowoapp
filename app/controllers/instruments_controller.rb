class InstrumentsController < ApplicationController

  def index
    @user = current_user
    @tickets = current_user.tickets.order('in_use DESC, is_valid DESC')
    
    @current_ticket = @user.current_valid_ticket
     
  end  
end

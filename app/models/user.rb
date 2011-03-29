class User < ActiveRecord::Base
  has_many  :created_tickets, :class_name => "Ticket", :foreign_key => "created_id"
  has_many  :tickets
end

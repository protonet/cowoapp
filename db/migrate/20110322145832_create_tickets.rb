class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :creator_id
      t.boolean :in_use, :default => false
      t.datetime :in_use_date
      t.boolean :is_valid, :default => true
      t.datetime :used_on
      t.date :expire_date
      
      t.string :type, :length => 20
      
      #parttime
      t.boolean :is_halfday
      t.integer :day_count
      t.integer :days_left
      
      #fulltime
      t.date :first_date
      t.date :last_date
      

      t.timestamps
    end
  end
  
  def self.down
    drop_table :tickets
  end
end

class CreateTicketLogs < ActiveRecord::Migration
  def self.up
    create_table :ticket_logs do |t|
      t.integer :user_id
      t.integer :ticket_id
      t.string :ip
      t.string :mac
      t.string :device_name
      t.string :usage

      t.timestamps
    end
  end

  def self.down
    drop_table :ticket_logs
  end
end

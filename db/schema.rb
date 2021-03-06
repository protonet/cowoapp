# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110331145648) do

  create_table "ticket_logs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "ticket_id"
    t.string   "ip"
    t.string   "mac"
    t.string   "device_name"
    t.string   "usage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", :force => true do |t|
    t.integer  "user_id"
    t.integer  "creator_id"
    t.boolean  "in_use",      :default => false
    t.datetime "in_use_date"
    t.boolean  "is_valid",    :default => true
    t.datetime "used_on"
    t.date     "expire_date"
    t.string   "type"
    t.boolean  "is_halfday"
    t.integer  "day_count"
    t.integer  "days_left"
    t.date     "first_date"
    t.date     "last_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

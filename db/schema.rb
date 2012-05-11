# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120511000834) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "start_time"
    t.string   "end_time"
    t.text     "description"
    t.string   "location_name"
    t.string   "location_address"
    t.string   "location_city"
    t.string   "location_state"
    t.string   "location_zip"
    t.string   "website"
    t.string   "cost"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "plans", :force => true do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "kisses"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sendevents", :force => true do |t|
    t.string   "event_name"
    t.string   "event_start_month"
    t.string   "event_start_day"
    t.string   "event_end_month"
    t.string   "event_end_day"
    t.string   "event_end_year"
    t.string   "event_start_hour"
    t.string   "event_start_minute"
    t.string   "event_start_ampm"
    t.string   "event_end_hour"
    t.string   "event_end_minute"
    t.string   "event_end_ampm"
    t.text     "event_description"
    t.string   "event_location_name"
    t.string   "event_location_address"
    t.string   "event_location_city"
    t.string   "event_location_state"
    t.string   "event_location_zip"
    t.string   "event_website"
    t.string   "event_cost"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "event_start_year"
    t.string   "event_start_date"
    t.string   "event_end_date"
  end

  create_table "subscriptions", :force => true do |t|
    t.string   "card"
    t.string   "description"
    t.string   "plan"
    t.string   "plan_id"
    t.string   "email"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "stripe_customer_token"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                 :default => false
    t.string   "plan"
    t.string   "plan_id"
    t.string   "sends_remaining"
    t.string   "stripe_customer_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end

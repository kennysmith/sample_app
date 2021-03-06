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

ActiveRecord::Schema.define(:version => 20120610160605) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "startdate"
    t.string   "starttime"
    t.string   "enddate"
    t.string   "endtime"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "events", ["user_id", "created_at"], :name => "index_events_on_user_id_and_created_at"

  create_table "payments", :force => true do |t|
    t.integer  "user_id"
    t.string   "stripe_id"
    t.string   "last_4_digits"
    t.date     "card_expiry_date"
    t.string   "card_type"
    t.string   "charge_id"
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

  create_table "subscriptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.string   "status"
    t.integer  "eventsremaining"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
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
    t.string   "stripe_customer_token"
    t.integer  "postsremaining"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end

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

ActiveRecord::Schema.define(:version => 20120620094237) do

  create_table "accounts", :force => true do |t|
    t.string   "name",                             :null => false
    t.string   "hashed_password",                  :null => false
    t.string   "salt",                             :null => false
    t.integer  "bank_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.decimal  "allowance",       :default => 0.0, :null => false
  end

  create_table "banks", :force => true do |t|
    t.string   "name",                                                                    :null => false
    t.decimal  "interest_rate",                                                           :null => false
    t.string   "interest_period",                                                         :null => false
    t.datetime "created_at",                                                              :null => false
    t.datetime "updated_at",                                                              :null => false
    t.string   "hashed_password", :default => "539a93b92323ca497e9a00576d70c155f4d2d61c", :null => false
    t.string   "salt",            :default => "611347a946294d749f0078e19cbc32febdc6311d", :null => false
  end

  create_table "transactions", :force => true do |t|
    t.string   "description"
    t.decimal  "amount",      :null => false
    t.decimal  "balance",     :null => false
    t.integer  "account_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end

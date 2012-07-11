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

ActiveRecord::Schema.define(:version => 20120711074910) do

  create_table "base_items", :force => true do |t|
    t.string  "name"
    t.text    "aliases"
    t.float   "space"
    t.float   "weight"
    t.float   "capacity"
    t.text    "accepts"
    t.text    "goes_in"
    t.text    "mount_points"
    t.integer "quantity"
    t.string  "cs_type"
  end

  create_table "items", :force => true do |t|
    t.integer "base_item_id"
    t.integer "parent_item_id"
    t.integer "player_id"
    t.string  "mount_point"
    t.boolean "trashed",        :default => false
  end

  create_table "loadouts", :force => true do |t|
    t.integer "player_id"
    t.string  "name"
    t.text    "loadout"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.text     "mount_points"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.float    "basic_lift"
    t.float    "basic_move"
    t.float    "dodge"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "playing"
  end

  add_index "players", ["email"], :name => "index_players_on_email", :unique => true
  add_index "players", ["reset_password_token"], :name => "index_players_on_reset_password_token", :unique => true

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

end

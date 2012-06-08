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

ActiveRecord::Schema.define(:version => 20120526023220) do

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
  end

  create_table "items", :force => true do |t|
    t.integer "base_item_id"
    t.integer "parent_item_id"
    t.integer "player_id"
    t.string  "mount_point"
  end

  create_table "loadouts", :force => true do |t|
    t.integer "player_id"
    t.string  "name"
    t.text    "loadout"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.text     "mount_points"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end

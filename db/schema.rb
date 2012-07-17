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

ActiveRecord::Schema.define(:version => 20120717103207) do

  create_table "allocations", :force => true do |t|
    t.integer  "setlist_id"
    t.integer  "song_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "songPosition"
  end

  add_index "allocations", ["setlist_id"], :name => "index_allocations_on_setlist_id"
  add_index "allocations", ["songPosition"], :name => "index_allocations_on_songPosition"
  add_index "allocations", ["song_id"], :name => "index_allocations_on_song_id"

  create_table "assignments", :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "tag"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categorizations", :force => true do |t|
    t.integer  "song_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "categorizations", ["category_id"], :name => "index_categorizations_on_category_id"
  add_index "categorizations", ["song_id"], :name => "index_categorizations_on_song_id"

  create_table "roles", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "roles", ["description"], :name => "index_roles_on_description", :unique => true

  create_table "services", :force => true do |t|
    t.date     "date"
    t.string   "leader"
    t.string   "acoustic"
    t.string   "electric"
    t.string   "piano"
    t.string   "bass"
    t.string   "drums"
    t.string   "sax"
    t.string   "violin"
    t.string   "singers"
    t.string   "soundAM"
    t.string   "soundPM"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "setlists", :force => true do |t|
    t.date     "date"
    t.boolean  "morning"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "songs", :force => true do |t|
    t.string   "title"
    t.string   "artist"
    t.text     "lyrics"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "key"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "surname"
    t.string   "phone"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end

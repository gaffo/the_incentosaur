# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081024024455) do

  create_table "author_feeds", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "feed_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "author_feeds", ["name", "feed_id"], :name => "unique_author_feed", :unique => true

  create_table "feed_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feeds", :force => true do |t|
    t.string   "url",                            :null => false
    t.string   "name",                           :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "idkey_xpath"
    t.string   "authorxpath"
    t.string   "full_post_xpath",                :null => false
    t.integer  "points",          :default => 1, :null => false
  end

  create_table "posts", :force => true do |t|
    t.integer  "feed_id",        :null => false
    t.integer  "author_feed_id", :null => false
    t.string   "idkey",          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "full_post"
    t.datetime "posted_date"
    t.string   "title"
    t.string   "link"
    t.text     "data"
  end

  add_index "posts", ["feed_id", "idkey"], :name => "unique_post_feed_and_idkey", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name",                          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password",   :default => "",    :null => false
    t.boolean  "is_admin",   :default => false, :null => false
  end

end

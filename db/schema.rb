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

ActiveRecord::Schema.define(:version => 20121213220756015) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.float    "lat"
    t.float    "long"
    t.string   "address"
    t.string   "address2"
    t.string   "category"
    t.string   "url"
    t.boolean  "hiring"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
    t.decimal  "rating_average", :precision => 6, :scale => 2, :default => 0.0
  end

  create_table "mycomments", :force => true do |t|
    t.integer  "user_id"
    t.string   "text"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rates", :force => true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.integer  "stars",         :null => false
    t.string   "dimension"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "rates", ["rateable_id", "rateable_type"], :name => "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], :name => "index_rates_on_rater_id"

  create_table "rating_caches", :force => true do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            :null => false
    t.integer  "qty",            :null => false
    t.string   "dimension"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], :name => "index_rating_caches_on_cacheable_id_and_cacheable_type"

  create_table "ratings", :force => true do |t|
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.integer  "value"
    t.integer  "user_id"
    t.string   "ip_address"
    t.string   "session_hash"
    t.string   "browser_fingerprint"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "ratings", ["rateable_type", "rateable_id", "ip_address", "browser_fingerprint"], :name => "ratings_index"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.string   "photo"
    t.boolean  "admin"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.datetime "oauth_expires_at"
    t.string   "oauth_token"
    t.string   "provider"
    t.string   "uid"
    t.integer  "reputation"
  end

end

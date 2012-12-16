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

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

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

  create_table "favorites", :force => true do |t|
    t.string   "favoriteable_type"
    t.integer  "favoriteable_id"
    t.integer  "user_id"
    t.string   "ip_address"
    t.string   "session_hash"
    t.string   "browser_fingerprint"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "favorites", ["favoriteable_type", "favoriteable_id", "ip_address", "browser_fingerprint"], :name => "favorites_index"

  create_table "friendings", :force => true do |t|
    t.integer  "friendor_id"
    t.integer  "friendee_id"
    t.boolean  "confirmed",   :default => false
    t.boolean  "rejected",    :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "friendings", ["friendee_id"], :name => "index_friendings_on_friendee_id"
  add_index "friendings", ["friendor_id"], :name => "index_friendings_on_friendor_id"

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

  create_table "reputation_actions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "reputations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "reputation_action_id"
    t.integer  "value"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "reputations", ["reputation_action_id"], :name => "index_reputations_on_reputation_action_id"
  add_index "reputations", ["user_id", "reputation_action_id"], :name => "user_reputation"

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

  create_table "votes", :force => true do |t|
    t.string   "voteable_type"
    t.integer  "voteable_id"
    t.integer  "user_id"
    t.integer  "value"
    t.string   "ip_address"
    t.string   "session_hash"
    t.string   "browser_fingerprint"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "votes", ["voteable_type", "voteable_id", "ip_address", "browser_fingerprint"], :name => "votes_index"

end

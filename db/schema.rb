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

ActiveRecord::Schema.define(:version => 20120527062853) do

  create_table "elections", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "from"
    t.date     "to"
  end

  create_table "image_assets", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "material_id"
  end

  create_table "materials", :force => true do |t|
    t.integer  "election_id"
    t.integer  "municipality_id"
    t.integer  "party_id"
    t.text     "topics"
    t.text     "polititians"
    t.text     "comment"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "user_id"
    t.string   "uploader_ip"
    t.boolean  "not_finished",    :default => false
  end

  create_table "materials_polititians", :id => false, :force => true do |t|
    t.integer "material_id",   :null => false
    t.integer "polititian_id", :null => false
  end

  add_index "materials_polititians", ["material_id", "polititian_id"], :name => "index_materials_polititians_on_material_id_and_polititian_id", :unique => true

  create_table "materials_topics", :id => false, :force => true do |t|
    t.integer "material_id", :null => false
    t.integer "topic_id",    :null => false
  end

  add_index "materials_topics", ["material_id", "topic_id"], :name => "index_materials_topics_on_material_id_and_topic_id", :unique => true

  create_table "municipalities", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "ancestry"
    t.string   "code"
    t.float    "gps_lat"
    t.float    "gps_lng"
    t.integer  "ancestry_depth", :default => 0
  end

  add_index "municipalities", ["ancestry"], :name => "index_municipalities_on_ancestry"

  create_table "parties", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "full_title"
    t.string   "displayed_value", :default => "title"
  end

  create_table "polititians", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "topics", :force => true do |t|
    t.string   "title"
    t.string   "ancestry"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "url_assets", :force => true do |t|
    t.string   "url"
    t.integer  "material_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "url_content"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "video_assets", :force => true do |t|
    t.text     "user_code"
    t.string   "video_id"
    t.string   "video_service"
    t.integer  "material_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
  end

end

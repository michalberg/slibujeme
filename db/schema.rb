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

ActiveRecord::Schema.define(:version => 20120414180228) do

  create_table "elections", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "materials", :force => true do |t|
    t.integer  "election_id"
    t.integer  "municipality_id"
    t.integer  "party_id"
    t.text     "topics"
    t.text     "polititians"
    t.text     "comment"
    t.string   "contact"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
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
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "ancestry"
    t.string   "code"
    t.float    "gps_lat"
    t.float    "gps_lng"
  end

  add_index "municipalities", ["ancestry"], :name => "index_municipalities_on_ancestry"

  create_table "parties", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "full_title"
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

end

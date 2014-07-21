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

ActiveRecord::Schema.define(:version => 20140718222153) do

  create_table "compartment_content_blocks", :force => true do |t|
    t.integer  "page_id"
    t.text     "content_area"
    t.text     "data"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "compartment_content_blocks", ["page_id"], :name => "index_compartment_content_blocks_on_page_id"

  create_table "compartment_pages", :force => true do |t|
    t.integer  "site_id"
    t.string   "path"
    t.string   "title"
    t.string   "template"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "compartment_pages", ["site_id"], :name => "index_compartment_pages_on_site_id"

  create_table "compartment_sites", :force => true do |t|
    t.string   "domain"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.boolean  "default",    :default => false
    t.string   "theme",      :default => "default"
  end

  create_table "compartment_users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.integer  "site_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end

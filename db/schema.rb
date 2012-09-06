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

ActiveRecord::Schema.define(:version => 20120806193914) do

  create_table "categories", :force => true do |t|
    t.string "name"
  end

  create_table "contacts", :force => true do |t|
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "mobile_no"
    t.string   "landline_no"
    t.integer  "house_no"
    t.integer  "administrator_id"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "pincode"
  end

  create_table "items", :force => true do |t|
    t.string  "name"
    t.string  "price"
    t.string  "description"
    t.integer "category_id"
    t.integer "administrator_id"
  end

  create_table "pictures", :force => true do |t|
    t.string  "picture_type"
    t.integer "administrator_id"
    t.string  "photo_file_name"
    t.string  "photo_content_type"
    t.integer "photo_file_sizer"
  end

  create_table "taxes", :force => true do |t|
    t.integer "value"
    t.integer "administrator_id"
  end

  create_table "users", :force => true do |t|
    t.string  "name"
    t.string  "password"
    t.string  "user_type"
    t.integer "administrator_id"
    t.string  "salt"
  end

end

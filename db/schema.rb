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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140114173914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "body"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_elements", force: true do |t|
    t.string   "type"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "service_id"
  end

  create_table "events", force: true do |t|
    t.text     "title"
    t.text     "description"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "place_id"
  end

  add_index "events", ["place_id"], name: "index_events_on_place_id", using: :btree

  create_table "headlines", force: true do |t|
    t.text     "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ideas", force: true do |t|
    t.string "type"
    t.string "title"
    t.string "description"
  end

  create_table "issues", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opening_times", force: true do |t|
    t.boolean  "vacation"
    t.integer  "day"
    t.integer  "open"
    t.integer  "close"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "schedule_id"
    t.integer  "service_start"
    t.integer  "service_end"
  end

  create_table "places", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", force: true do |t|
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schedules", ["place_id"], name: "index_schedules_on_place_id", using: :btree

  create_table "services", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "societies", force: true do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tag_links", force: true do |t|
    t.integer "article_id"
    t.integer "tag_id"
  end

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "login",                default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",        default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "email"
    t.string   "encrypted_password"
    t.datetime "confirmed_at"
    t.string   "confirmation_token"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree

end

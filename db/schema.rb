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

ActiveRecord::Schema.define(version: 20140115021425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "body"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["slug"], name: "index_articles_on_slug", unique: true, using: :btree

  create_table "blog_posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "blog_posts", ["slug"], name: "index_blog_posts_on_slug", unique: true, using: :btree

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
    t.string   "slug"
  end

  add_index "events", ["place_id"], name: "index_events_on_place_id", using: :btree
  add_index "events", ["slug"], name: "index_events_on_slug", unique: true, using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

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

  create_table "menu_categories", force: true do |t|
    t.string   "name"
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menu_categories", ["menu_id"], name: "index_menu_categories_on_menu_id", using: :btree

  create_table "menu_items", force: true do |t|
    t.string   "name"
    t.integer  "menu_category_id"
    t.decimal  "price",            precision: 8, scale: 2
    t.text     "description"
    t.text     "additional_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", force: true do |t|
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menus", ["place_id"], name: "index_menus_on_place_id", using: :btree

  create_table "officers", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "officers", ["user_id"], name: "index_officers_on_user_id", using: :btree

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
    t.boolean  "shown"
    t.string   "slug"
  end

  add_index "places", ["slug"], name: "index_places_on_slug", unique: true, using: :btree

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
    t.string   "slug"
  end

  add_index "services", ["slug"], name: "index_services_on_slug", unique: true, using: :btree

  create_table "societies", force: true do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "societies", ["slug"], name: "index_societies_on_slug", unique: true, using: :btree

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
    t.boolean  "elevated"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree

  create_table "zones", force: true do |t|
    t.string   "name"
    t.integer  "officer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "zones", ["officer_id"], name: "index_zones_on_officer_id", using: :btree

end

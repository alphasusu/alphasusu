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

ActiveRecord::Schema.define(version: 20140223155656) do

  create_table "academic_units", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "faculty_id"
  end

  add_index "academic_units", ["faculty_id"], name: "index_academic_units_on_faculty_id"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "body"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  add_index "articles", ["slug"], name: "index_articles_on_slug", unique: true

  create_table "blog_posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "user_id"
  end

  add_index "blog_posts", ["slug"], name: "index_blog_posts_on_slug", unique: true

  create_table "committee_memberships", force: true do |t|
    t.integer  "officer_id"
    t.integer  "subcommittee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "committee_memberships", ["officer_id"], name: "index_committee_memberships_on_officer_id"
  add_index "committee_memberships", ["subcommittee_id"], name: "index_committee_memberships_on_subcommittee_id"

  create_table "contact_elements", force: true do |t|
    t.string   "type"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "service_id"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "academic_unit_id"
  end

  add_index "courses", ["academic_unit_id"], name: "index_courses_on_academic_unit_id"

  create_table "events", force: true do |t|
    t.text     "title"
    t.text     "description"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "place_id"
    t.string   "slug"
  end

  add_index "events", ["place_id"], name: "index_events_on_place_id"
  add_index "events", ["slug"], name: "index_events_on_slug", unique: true

  create_table "faculties", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

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
    t.string   "slug"
  end

  add_index "issues", ["slug"], name: "index_issues_on_slug", unique: true

  create_table "menu_categories", force: true do |t|
    t.string   "name"
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menu_categories", ["menu_id"], name: "index_menu_categories_on_menu_id"

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

  add_index "menus", ["place_id"], name: "index_menus_on_place_id"

  create_table "messages", force: true do |t|
    t.string   "subject"
    t.text     "body",         limit: 255
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "officers", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.integer  "course_id"
    t.string   "year"
    t.integer  "faculty_id"
    t.integer  "academic_unit_id"
    t.text     "description"
  end

  add_index "officers", ["academic_unit_id"], name: "index_officers_on_academic_unit_id"
  add_index "officers", ["course_id"], name: "index_officers_on_course_id"
  add_index "officers", ["faculty_id"], name: "index_officers_on_faculty_id"
  add_index "officers", ["user_id"], name: "index_officers_on_user_id"

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

  create_table "permissions", force: true do |t|
    t.integer  "user_id"
    t.string   "subject_class"
    t.integer  "subject_id"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", force: true do |t|
    t.string   "name"
    t.text     "description", limit: 255
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "shown"
    t.string   "slug"
  end

  add_index "places", ["slug"], name: "index_places_on_slug", unique: true

  create_table "schedules", force: true do |t|
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schedules", ["place_id"], name: "index_schedules_on_place_id"

  create_table "services", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "services", ["slug"], name: "index_services_on_slug", unique: true

  create_table "societies", force: true do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "societies", ["slug"], name: "index_societies_on_slug", unique: true

  create_table "student_group_kinds", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_group_kinds", ["name"], name: "index_student_group_kinds_on_name", unique: true

  create_table "student_groups", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "zone_id"
  end

  create_table "student_groups_and_kinds", force: true do |t|
    t.integer "student_group_id"
    t.integer "student_group_kind_id"
  end

  create_table "subcommittees", force: true do |t|
    t.text     "name"
    t.integer  "zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subcommittees", ["zone_id"], name: "index_subcommittees_on_zone_id"

  create_table "support_teams", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "support_teams_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "support_team_id"
  end

  add_index "support_teams_users", ["user_id", "support_team_id"], name: "index_support_teams_users_on_user_id_and_support_team_id"

  create_table "tag_links", force: true do |t|
    t.integer "article_id"
    t.integer "tag_id"
  end

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password"
    t.datetime "confirmed_at"
    t.string   "confirmation_token"
    t.datetime "confirmation_sent_at"
    t.boolean  "elevated"
    t.string   "unconfirmed_email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "course_id"
    t.string   "year"
  end

  add_index "users", ["course_id"], name: "index_users_on_course_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "zones", force: true do |t|
    t.string   "name"
    t.integer  "officer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "zones", ["officer_id"], name: "index_zones_on_officer_id"

end

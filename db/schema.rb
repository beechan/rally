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

ActiveRecord::Schema.define(version: 20160620013726) do

  create_table "events", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "event_name"
    t.string   "place"
    t.string   "content"
    t.datetime "event_starting_time"
    t.datetime "event_end_time"
    t.boolean  "event_status"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "visitor_id"
    t.boolean  "event_flag"
    t.boolean  "attendance_status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "relationships", ["event_id"], name: "index_relationships_on_event_id"
  add_index "relationships", ["visitor_id"], name: "index_relationships_on_visitor_id"

  create_table "schedules", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "starting_time"
    t.datetime "end_time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end

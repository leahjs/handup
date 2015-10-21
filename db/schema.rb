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

ActiveRecord::Schema.define(version: 20150429181252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boroughs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "uid"
    t.string   "provider"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "needs", force: :cascade do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "category"
  end

  create_table "searches", force: :cascade do |t|
    t.string   "profile_photo"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "school_name"
    t.string   "major"
    t.string   "gender"
    t.string   "race"
    t.string   "location"
    t.float    "gpa"
    t.string   "status"
    t.float    "total_received"
    t.float    "total_given"
    t.string   "bio"
    t.boolean  "discoverable"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "sponsor_needs", force: :cascade do |t|
    t.float    "amount_given"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "student_need_id"
    t.string   "charge"
    t.integer  "sponsor_id"
  end

  create_table "student_achievements", force: :cascade do |t|
    t.string   "status"
    t.integer  "student_id"
    t.integer  "achievement_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "student_challenges", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "sponsor_id"
    t.integer  "student_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "accepted"
    t.integer  "amount"
    t.string   "description"
  end

  create_table "student_needs", force: :cascade do |t|
    t.float    "need_expense"
    t.boolean  "need_met"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id"
    t.integer  "need_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "total_amount", default: 0
    t.string   "proof"
    t.text     "description"
    t.string   "state",        default: "pending"
  end

  create_table "student_sponsors", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "sponsor_id"
    t.boolean  "sponsored",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "profile_photo"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "school_name"
    t.string   "major"
    t.string   "gender"
    t.string   "race"
    t.string   "location"
    t.float    "gpa"
    t.string   "status"
    t.float    "total_received"
    t.float    "total_given"
    t.string   "bio"
    t.boolean  "discoverable"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "provider"
    t.string   "uid"
    t.date     "spring_semester"
    t.date     "fall_semester"
    t.integer  "borough_id"
  end

  add_index "users", ["borough_id"], name: "index_users_on_borough_id", using: :btree

  add_foreign_key "identities", "users"
  add_foreign_key "users", "boroughs"
end

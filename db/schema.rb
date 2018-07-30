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

ActiveRecord::Schema.define(version: 20180730164801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "submission_id"
    t.integer  "parent_comment_id"
    t.string   "content"
    t.integer  "vote_count",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_change_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_changes", force: :cascade do |t|
    t.integer  "submission_id"
    t.integer  "change_object_id"
    t.string   "change_object_type"
    t.integer  "post_change_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "statuses", ["name"], name: "index_statuses_on_name", using: :btree

  create_table "submissions", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "title"
    t.string   "content"
    t.string   "user_id"
    t.integer  "category_id"
    t.integer  "vote_count",  default: 0
    t.integer  "status_id"
  end

  add_index "submissions", ["category_id"], name: "index_submissions_on_category_id", using: :btree
  add_index "submissions", ["status_id"], name: "index_submissions_on_status_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.string   "salt"
    t.boolean  "admin"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "activation_digest"
    t.boolean  "activated"
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "votes", force: :cascade do |t|
    t.integer "post_id"
    t.integer "weight",    default: 1, null: false
    t.integer "user_id"
    t.string  "post_type"
  end

  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  create_table "watches", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "submission_id"
  end

  add_index "watches", ["submission_id"], name: "index_watches_on_submission_id"
  add_index "watches", ["user_id"], name: "index_watches_on_user_id"

end

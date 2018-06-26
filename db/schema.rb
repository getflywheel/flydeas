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

<<<<<<< HEAD

ActiveRecord::Schema.define(version: 20180625195911) do
||||||| merged common ancestors
ActiveRecord::Schema.define(version: 20180625195911) do
=======
ActiveRecord::Schema.define(version: 20180626193336) do
>>>>>>> Vote model complete, inital dashboard stuff

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submissions", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.string   "content"
    t.string   "user_id"
    t.integer  "category_id"
  end

  add_index "submissions", ["category_id"], name: "index_submissions_on_category_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.string   "salt"
    t.boolean  "admin"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
  end

  create_table "votes", force: :cascade do |t|
    t.integer "submission_id"
    t.integer "weight",        default: 1, null: false
    t.integer "user_id"
  end

  add_index "votes", ["user_id", "submission_id"], name: "index_votes_on_user_id_and_submission_id", unique: true
  add_index "votes", ["user_id"], name: "index_votes_on_user_id"

end

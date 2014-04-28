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

ActiveRecord::Schema.define(version: 20140428035238) do

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.string   "answer_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hint"
  end

  create_table "questions", force: true do |t|
    t.text     "prompt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "correct_answer_id"
    t.string   "hint"
    t.integer  "difficulty",        default: 5, null: false
  end

  create_table "questions_skills", id: false, force: true do |t|
    t.integer "question_id"
    t.integer "skill_id"
  end

  add_index "questions_skills", ["question_id", "skill_id"], name: "index_questions_skills_on_question_id_and_skill_id"

  create_table "skills", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_skills", force: true do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.integer  "level",      default: 6
    t.integer  "max_level",  default: 10
    t.integer  "min_level",  default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_skills", ["skill_id"], name: "index_user_skills_on_skill_id"
  add_index "user_skills", ["user_id"], name: "index_user_skills_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "hashed_password", null: false
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["slug"], name: "index_users_on_slug"
  add_index "users", ["username"], name: "index_users_on_username"

end

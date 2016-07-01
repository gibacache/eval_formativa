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

ActiveRecord::Schema.define(version: 20160630224727) do

  create_table "argumentative_answers", force: :cascade do |t|
    t.string   "answer"
    t.string   "argument"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "argumentative_questions", force: :cascade do |t|
    t.text     "question"
    t.string   "answer1"
    t.string   "answer2"
    t.string   "answer3"
    t.string   "answer4"
    t.string   "argument1"
    t.string   "argument2"
    t.string   "argument3"
    t.string   "argument4"
    t.integer  "correct_answer"
    t.integer  "correct_argument"
    t.text     "feedback_wrong_argument"
    t.text     "feedback_wrong_all"
    t.string   "subject"
    t.string   "critical_thinking"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "nodes", force: :cascade do |t|
    t.integer  "tree_id",              null: false
    t.integer  "questionable_id",      null: false
    t.string   "questionable_type"
    t.integer  "next_node_correct_id"
    t.integer  "next_node_wrong_id"
    t.boolean  "first_node"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "nodes", ["questionable_id"], name: "index_nodes_on_questionable_id"
  add_index "nodes", ["tree_id"], name: "index_nodes_on_tree_id"

  create_table "responses", force: :cascade do |t|
    t.integer  "user_id",         null: false
    t.integer  "answerable_id",   null: false
    t.string   "answerable_type"
    t.integer  "node_id"
    t.integer  "score"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "responses", ["answerable_id"], name: "index_responses_on_answerable_id"
  add_index "responses", ["user_id"], name: "index_responses_on_user_id"

  create_table "trees", force: :cascade do |t|
    t.integer  "first_node_id"
    t.integer  "n_repeat"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "student_id", null: false
    t.string   "username"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["student_id"], name: "index_users_on_student_id"

end

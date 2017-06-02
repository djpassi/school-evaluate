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



ActiveRecord::Schema.define(version: 20170602165449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "name"
    t.string   "text"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "genre"
    t.string   "skill"
    t.integer  "category"
  end

  create_table "contains", force: :cascade do |t|
    t.integer  "survey_schema_id"
    t.integer  "question_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["question_id"], name: "index_contains_on_question_id", using: :btree
    t.index ["survey_schema_id"], name: "index_contains_on_survey_schema_id", using: :btree
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.integer  "survey_schema_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "evaluation_number"
    t.index ["answer_id"], name: "index_evaluations_on_answer_id", using: :btree
    t.index ["survey_schema_id"], name: "index_evaluations_on_survey_schema_id", using: :btree
    t.index ["user_id"], name: "index_evaluations_on_user_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "genre"
    t.string   "skill"
    t.integer  "category"
  end

  create_table "survey_schemas", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "cycle"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.integer  "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "contains", "questions"
  add_foreign_key "contains", "survey_schemas"
  add_foreign_key "evaluations", "answers"
  add_foreign_key "evaluations", "survey_schemas"
  add_foreign_key "evaluations", "users"
end

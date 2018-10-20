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

ActiveRecord::Schema.define(version: 20181020162600) do

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.text     "about"
    t.string   "background"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "background"
    t.integer  "rating"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "background"
    t.integer  "rating"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "field_id"
  end

  create_table "community_categories", force: :cascade do |t|
    t.integer  "community_id"
    t.integer  "category_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "community_fields", force: :cascade do |t|
    t.integer  "community_id"
    t.integer  "field_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "community_jobs", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "community_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "employer_fields", force: :cascade do |t|
    t.integer  "employer_id"
    t.integer  "field_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "employer_jobs", force: :cascade do |t|
    t.integer  "employer_id"
    t.integer  "job_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "employers", force: :cascade do |t|
    t.string   "company_name"
    t.string   "pitch"
    t.text     "about"
    t.text     "company_mission"
    t.string   "hq_location"
    t.string   "number_of_employees"
    t.string   "year_founded"
    t.string   "logo"
    t.string   "background"
    t.string   "link"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "industry"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
  end

  create_table "fields", force: :cascade do |t|
    t.string   "name"
    t.text     "description", default: ""
    t.string   "background"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "ideas", force: :cascade do |t|
    t.string   "title"
    t.string   "country"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
    t.string   "link"
    t.text     "news_description"
    t.integer  "user_id"
  end

  create_table "job_categories", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "position"
    t.text     "purpose"
    t.text     "impact"
    t.string   "location"
    t.boolean  "is_remote",               default: false
    t.boolean  "is_special_requirements", default: false
    t.text     "special_requirements"
    t.text     "responsibilities"
    t.text     "job_description"
    t.string   "link"
    t.string   "email_to_contact"
    t.integer  "salary"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "employer_id"
    t.text     "requirements"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.integer  "community_id"
  end

  create_table "project_fields", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description", default: ""
    t.string   "image"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
  end

  create_table "updates", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.text     "about"
    t.string   "avatar"
    t.string   "background"
    t.boolean  "admin",                  default: false
    t.integer  "status",                 default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

end

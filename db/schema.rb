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

ActiveRecord::Schema.define(version: 20160815183025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "nps"
    t.integer  "trust"
    t.text     "comment"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_feedbacks_on_user_id", using: :btree
  end

  create_table "fin_profiles", force: :cascade do |t|
    t.string   "savvy_feel"
    t.decimal  "student_amount"
    t.decimal  "cc_amount"
    t.decimal  "savings_amount"
    t.hstore   "investments_type"
    t.string   "spend_vs_income"
    t.hstore   "future_day"
    t.string   "preparedness"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "cc_feeling"
    t.string   "cc_approach"
    t.decimal  "cc_rate"
    t.string   "student_feeling"
    t.string   "student_approach"
    t.decimal  "student_rate"
    t.string   "biggest_expense"
    t.integer  "expense_frequency"
    t.string   "current_focus"
    t.index ["user_id"], name: "index_fin_profiles_on_user_id", using: :btree
  end

  create_table "guest_users", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.decimal  "student_amount"
    t.decimal  "cc_amount"
    t.decimal  "savings_amount"
    t.hstore   "investments_type"
    t.string   "spend_vs_income"
    t.hstore   "future_day"
    t.string   "preparedness"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "savvy_feel"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.integer  "age"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "phone_number"
    t.integer  "guest_user_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "fin_profiles", "users"
end

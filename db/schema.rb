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

ActiveRecord::Schema.define(version: 20161222201300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "beta_users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "start_or_remind"
  end

  create_table "bills", force: :cascade do |t|
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "saver_guest_id"
    t.index ["saver_guest_id"], name: "index_bills_on_saver_guest_id", using: :btree
  end

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
    t.hstore   "future_day"
    t.string   "preparedness"
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "cc_approach"
    t.decimal  "cc_rate"
    t.string   "student_feeling"
    t.string   "student_approach"
    t.decimal  "student_rate"
    t.string   "biggest_expense"
    t.integer  "expense_frequency"
    t.string   "current_focus"
    t.string   "saving_purpose"
    t.text     "saving_purpose_free_form"
    t.string   "student_attitude"
    t.string   "cc_attitude"
    t.string   "cc_feeling"
    t.integer  "piggies",                  default: 0
    t.string   "spend_less"
    t.string   "savings_from_income"
    t.string   "company_401k"
    t.boolean  "company_matches"
    t.string   "invest_now"
    t.string   "invest_decision"
    t.index ["user_id"], name: "index_fin_profiles_on_user_id", using: :btree
  end

  create_table "guest_users", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "explain_stocks_vs_funds"
    t.string   "worry_about_risks"
    t.string   "curious_about_access_to_money"
    t.string   "remaining_concerns_about_access"
    t.string   "investment_goal"
    t.string   "post_investment_goal"
    t.string   "knows_amount_to_invest"
    t.integer  "amount_wants_to_invest"
    t.integer  "amount_to_get_started"
    t.string   "has_retirement_account"
    t.string   "has_invested_before"
    t.string   "explain_diversification"
    t.hstore   "has_these_types_of_debt"
    t.text     "questions"
    t.string   "follow_up_prefs"
    t.text     "concerns_about_risks"
    t.string   "email"
    t.string   "previous_investment_service"
  end

  create_table "investing_feedbacks", force: :cascade do |t|
    t.string   "investment_service"
    t.string   "invested_amount"
    t.text     "investing_experience"
    t.text     "investing_better"
    t.text     "got_stuck"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["user_id"], name: "index_investing_feedbacks_on_user_id", using: :btree
  end

  create_table "investing_profiles", force: :cascade do |t|
    t.string   "explain_stocks_vs_funds"
    t.string   "worry_about_risks"
    t.string   "curious_about_access_to_money"
    t.string   "remaining_concerns_about_access"
    t.string   "investment_goal"
    t.string   "post_investment_goal"
    t.string   "knows_amount_to_invest"
    t.integer  "amount_wants_to_invest"
    t.integer  "amount_to_get_started"
    t.string   "has_retirement_account"
    t.string   "has_invested_before"
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "explain_diversification"
    t.hstore   "has_these_types_of_debt"
    t.text     "questions"
    t.string   "follow_up_prefs"
    t.text     "concerns_about_risks"
    t.string   "investment_service"
    t.string   "invested_amount"
    t.text     "investing_experience"
    t.text     "investing_better"
    t.string   "previous_investment_service"
    t.string   "service_choice"
    t.string   "vanguard_target_date"
    t.string   "got_stuck"
    t.index ["user_id"], name: "index_investing_profiles_on_user_id", using: :btree
  end

  create_table "saver_guests", force: :cascade do |t|
    t.string   "last_moved"
    t.string   "negotiated"
    t.hstore   "services"
    t.string   "email"
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "another_year"
  end

  create_table "savvy_score_users", force: :cascade do |t|
    t.string   "name"
    t.string   "age"
    t.string   "savvy_feel"
    t.hstore   "debt_types"
    t.string   "cc_amount"
    t.string   "cc_approach"
    t.string   "student_loan_amount"
    t.string   "personal_loan_amount"
    t.string   "savings_amount"
    t.string   "spending_habit"
    t.string   "debt_question"
    t.string   "savings_question"
    t.string   "investment_question"
    t.string   "spending_question"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "student_loan_approach"
    t.hstore   "investment_types"
    t.string   "personal_loans_interest"
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
    t.string   "chat_type"
    t.string   "contact_prefs"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bills", "saver_guests"
  add_foreign_key "fin_profiles", "users"
  add_foreign_key "investing_feedbacks", "users"
  add_foreign_key "investing_profiles", "users"
end

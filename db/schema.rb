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

ActiveRecord::Schema.define(version: 20160802205311) do

  create_table "users", force: :cascade do |t|
    t.string   "why_here"
    t.string   "money_feels"
    t.string   "name"
    t.integer  "age"
    t.boolean  "student_loans"
    t.decimal  "student_amount"
    t.boolean  "cc_debt"
    t.decimal  "cc_amount"
    t.boolean  "savings"
    t.decimal  "savings_amount"
    t.boolean  "investments"
    t.text     "investments_type"
    t.text     "spend_vs_income"
    t.text     "present_day"
    t.text     "future_day"
    t.decimal  "financial_score"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "email"
  end

end

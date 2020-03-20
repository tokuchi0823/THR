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

ActiveRecord::Schema.define(version: 20200320092850) do

  create_table "attendances", force: :cascade do |t|
    t.date "worked_on"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string "note"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "end_plan"
    t.boolean "next_day_flag", default: false
    t.string "gyoumu"
    t.integer "status", default: 0
    t.string "superior_id"
    t.integer "check", default: 0
    t.datetime "first_start_time"
    t.datetime "first_end_time"
    t.datetime "second_start_time"
    t.datetime "second_end_time"
    t.integer "change_status", default: 0
    t.string "change_superior_id"
    t.string "one_month_superior_id"
    t.integer "one_month_status"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "purpose"
    t.datetime "meetdate"
    t.string "meeting_place"
    t.string "destination"
    t.integer "secretary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sankas_count", default: 0, null: false
    t.string "overview"
    t.datetime "finish_date"
    t.string "passing_point1"
    t.string "passing_point2"
    t.string "passing_point3"
    t.string "passing_point4"
    t.string "passing_point5"
    t.datetime "deadline_date"
    t.string "caution"
    t.integer "displacement_limit"
  end

  create_table "sankas", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comment"
    t.index ["plan_id"], name: "index_sankas_on_plan_id"
    t.index ["user_id", "plan_id"], name: "index_sankas_on_user_id_and_plan_id", unique: true
    t.index ["user_id"], name: "index_sankas_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "department"
    t.datetime "basic_time", default: "2020-03-19 23:00:00"
    t.datetime "work_time", default: "2020-03-19 22:30:00"
    t.string "employee_number"
    t.string "uid"
    t.datetime "designated_work_start_time", default: "2020-03-20 00:00:00"
    t.datetime "designated_work_end_time", default: "2020-03-20 09:00:00"
    t.boolean "superior", default: false
    t.string "bike"
    t.integer "displacement"
    t.boolean "intercom", default: false
    t.boolean "etc", default: false
    t.integer "continuous_cruising_distance"
    t.boolean "navi", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end

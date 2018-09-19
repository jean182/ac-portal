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

ActiveRecord::Schema.define(version: 2018_09_19_205925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checklists", force: :cascade do |t|
    t.string "name"
    t.decimal "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "phase_id"
    t.index ["phase_id"], name: "index_checklists_on_phase_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address_line1"
    t.string "address_line2"
    t.string "postal_code"
    t.string "city"
    t.string "state"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_locations_on_admin_id"
  end

  create_table "mentors", force: :cascade do |t|
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "text"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "task_id"
    t.index ["task_id"], name: "index_messages_on_task_id"
  end

  create_table "milestones", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "phase_id"
    t.index ["phase_id"], name: "index_milestones_on_phase_id"
  end

  create_table "phases", force: :cascade do |t|
    t.string "learning_objetive"
    t.decimal "phase_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "checklist_id"
    t.index ["checklist_id"], name: "index_tags_on_checklist_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "description"
    t.boolean "is_complete"
    t.decimal "score"
    t.boolean "is_approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "checklist_id"
    t.index ["checklist_id"], name: "index_tasks_on_checklist_id"
  end

  create_table "time_trackings", force: :cascade do |t|
    t.date "date"
    t.decimal "hours_spent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "mentor_id"
    t.bigint "client_id"
    t.index ["client_id"], name: "index_time_trackings_on_client_id"
    t.index ["mentor_id"], name: "index_time_trackings_on_mentor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "title"
    t.string "phone"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account_type"
    t.integer "account_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "checklists", "phases"
  add_foreign_key "locations", "admins"
  add_foreign_key "messages", "tasks"
  add_foreign_key "milestones", "phases"
  add_foreign_key "tags", "checklists"
  add_foreign_key "tasks", "checklists"
  add_foreign_key "time_trackings", "clients"
  add_foreign_key "time_trackings", "mentors"
end

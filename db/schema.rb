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

ActiveRecord::Schema.define(version: 2018_10_12_180656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checklists", force: :cascade do |t|
    t.string "name"
    t.decimal "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "phase_id"
    t.index ["phase_id"], name: "index_checklists_on_phase_id"
  end

  create_table "client_infos", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.integer "client_id"
    t.index ["client_id"], name: "index_client_infos_on_client_id"
    t.index ["company_id"], name: "index_client_infos_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "mentor_id"
    t.string "phone"
    t.index ["mentor_id"], name: "index_companies_on_mentor_id"
  end

  create_table "has_tags", force: :cascade do |t|
    t.bigint "checklist_id"
    t.bigint "tag_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "mentor_id"
    t.index ["checklist_id"], name: "index_has_tags_on_checklist_id"
    t.index ["company_id"], name: "index_has_tags_on_company_id"
    t.index ["mentor_id"], name: "index_has_tags_on_mentor_id"
    t.index ["tag_id"], name: "index_has_tags_on_tag_id"
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
    t.bigint "company_id"
    t.index ["admin_id"], name: "index_locations_on_admin_id"
    t.index ["company_id"], name: "index_locations_on_company_id"
  end

  create_table "mentor_infos", force: :cascade do |t|
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mentor_id"
    t.index ["mentor_id"], name: "index_mentor_infos_on_mentor_id"
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
    t.boolean "complete"
    t.index ["phase_id"], name: "index_milestones_on_phase_id"
  end

  create_table "phases", force: :cascade do |t|
    t.string "learning_objetive"
    t.integer "phase_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.integer "status"
    t.index ["company_id"], name: "index_phases_on_company_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tag_type"
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
    t.bigint "company_id"
    t.index ["client_id"], name: "index_time_trackings_on_client_id"
    t.index ["company_id"], name: "index_time_trackings_on_company_id"
    t.index ["mentor_id"], name: "index_time_trackings_on_mentor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
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
    t.datetime "deleted_at"
    t.string "type"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "checklists", "phases"
  add_foreign_key "client_infos", "companies"
  add_foreign_key "companies", "users", column: "mentor_id"
  add_foreign_key "has_tags", "checklists"
  add_foreign_key "has_tags", "companies"
  add_foreign_key "has_tags", "tags"
  add_foreign_key "has_tags", "users", column: "mentor_id"
  add_foreign_key "locations", "companies"
  add_foreign_key "locations", "users", column: "admin_id"
  add_foreign_key "messages", "tasks"
  add_foreign_key "milestones", "phases"
  add_foreign_key "phases", "companies"
  add_foreign_key "tasks", "checklists"
  add_foreign_key "time_trackings", "companies"
  add_foreign_key "time_trackings", "users", column: "client_id"
  add_foreign_key "time_trackings", "users", column: "mentor_id"
end

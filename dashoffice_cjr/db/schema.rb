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

ActiveRecord::Schema.define(version: 2019_04_12_114917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cores", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deal_steps", force: :cascade do |t|
    t.bigint "step_id"
    t.bigint "deal_id"
    t.date "entry_date"
    t.date "conclusion_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deal_id"], name: "index_deal_steps_on_deal_id"
    t.index ["step_id"], name: "index_deal_steps_on_step_id"
  end

  create_table "deal_tags", force: :cascade do |t|
    t.bigint "deal_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deal_id"], name: "index_deal_tags_on_deal_id"
    t.index ["tag_id"], name: "index_deal_tags_on_tag_id"
  end

  create_table "deals", force: :cascade do |t|
    t.bigint "customer_id"
    t.string "name"
    t.text "description"
    t.bigint "primary_seller_id"
    t.bigint "secondary_seller_id"
    t.date "start_date"
    t.boolean "active"
    t.boolean "done"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_deals_on_customer_id"
    t.index ["primary_seller_id"], name: "index_deals_on_primary_seller_id"
    t.index ["secondary_seller_id"], name: "index_deals_on_secondary_seller_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.bigint "user_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "project_developers", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "user_id"
    t.boolean "project_manager"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_developers_on_project_id"
    t.index ["user_id"], name: "index_project_developers_on_user_id"
  end

  create_table "project_requirements", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "requirement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_requirements_on_project_id"
    t.index ["requirement_id"], name: "index_project_requirements_on_requirement_id"
  end

  create_table "project_tags", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_tags_on_project_id"
    t.index ["tag_id"], name: "index_project_tags_on_tag_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.bigint "customer_id"
    t.date "start_date"
    t.date "conclusion_date"
    t.boolean "open_scope"
    t.integer "sprints"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_projects_on_customer_id"
  end

  create_table "requirements", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.integer "sprints"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steps", force: :cascade do |t|
    t.string "name"
    t.integer "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "troubles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_troubles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "trouble_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trouble_id"], name: "index_user_troubles_on_trouble_id"
    t.index ["user_id"], name: "index_user_troubles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "admin"
    t.bigint "role_id"
    t.bigint "core_id"
    t.boolean "active"
    t.index ["core_id"], name: "index_users_on_core_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "deal_steps", "deals"
  add_foreign_key "deal_steps", "steps"
  add_foreign_key "deal_tags", "deals"
  add_foreign_key "deal_tags", "tags"
  add_foreign_key "deals", "customers"
  add_foreign_key "deals", "users", column: "primary_seller_id"
  add_foreign_key "deals", "users", column: "secondary_seller_id"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "project_developers", "projects"
  add_foreign_key "project_developers", "users"
  add_foreign_key "project_requirements", "projects"
  add_foreign_key "project_requirements", "requirements"
  add_foreign_key "project_tags", "projects"
  add_foreign_key "project_tags", "tags"
  add_foreign_key "projects", "customers"
  add_foreign_key "user_troubles", "troubles"
  add_foreign_key "user_troubles", "users"
  add_foreign_key "users", "cores"
  add_foreign_key "users", "roles"
end

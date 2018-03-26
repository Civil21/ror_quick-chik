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

ActiveRecord::Schema.define(version: 20180326110731) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_institutions", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "institution_id"
  end

  create_table "institution_comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "institution_id"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "address"
    t.string "phoneNumber"
    t.string "images"
    t.float "kitchen", default: 0.0, null: false
    t.float "servise", default: 0.0, null: false
    t.float "cleannes", default: 0.0, null: false
    t.float "atmosphere", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rating_comments", force: :cascade do |t|
    t.integer "rating_id"
    t.integer "user_id"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "institution_id"
    t.integer "user_id"
    t.integer "kitchen", default: 1, null: false
    t.integer "servise", default: 1, null: false
    t.integer "cleannes", default: 1, null: false
    t.integer "atmosphere", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "text"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_times", force: :cascade do |t|
    t.integer "institution_id"
    t.boolean "mondayWork"
    t.string "mondayStart"
    t.string "mondayEnd"
    t.boolean "tuesdayWork"
    t.string "tuesdayStart"
    t.string "tuesdayEnd"
    t.boolean "wednesdayWork"
    t.string "wednesdayStart"
    t.string "wednesdayEnd"
    t.boolean "thursdayWork"
    t.string "thursdayStart"
    t.string "thursdayEnd"
    t.boolean "fridayWork"
    t.string "fridayStart"
    t.string "fridayEnd"
    t.boolean "saturdayWork"
    t.string "saturdayStart"
    t.string "saturdayEnd"
    t.boolean "sundayWork"
    t.string "sundayStart"
    t.string "sundayEnd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

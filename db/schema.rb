# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_06_052412) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companions", force: :cascade do |t|
    t.string "nickname"
    t.string "relationship"
    t.string "acquainted"
    t.string "closeness"
    t.string "solution"
    t.string "partner_gender"
    t.string "partner_age"
    t.string "other"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companions_on_user_id"
  end

  create_table "exchanges", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "companion_id"
    t.index ["companion_id"], name: "index_exchanges_on_companion_id"
    t.index ["user_id"], name: "index_exchanges_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "exchange_id", null: false
    t.text "body"
    t.integer "sender", null: false
    t.datetime "datetime"
    t.integer "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exchange_id"], name: "index_messages_on_exchange_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.string "myself_gender"
    t.integer "myself_age"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "companions", "users"
  add_foreign_key "exchanges", "companions"
  add_foreign_key "exchanges", "users"
  add_foreign_key "messages", "exchanges"
end

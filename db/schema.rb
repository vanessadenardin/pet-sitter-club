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

ActiveRecord::Schema.define(version: 2021_05_18_055744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.bigint "client_id_id", null: false
    t.bigint "pet_sitter_id_id", null: false
    t.datetime "date"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id_id"], name: "index_orders_on_client_id_id"
    t.index ["pet_sitter_id_id"], name: "index_orders_on_pet_sitter_id_id"
  end

  create_table "pet_types", force: :cascade do |t|
    t.string "pet_type_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pets", force: :cascade do |t|
    t.bigint "client_id_id", null: false
    t.bigint "pet_types_id", null: false
    t.string "name"
    t.integer "age"
    t.string "observations"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id_id"], name: "index_pets_on_client_id_id"
    t.index ["pet_types_id"], name: "index_pets_on_pet_types_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "review"
    t.datetime "date"
    t.integer "rating"
    t.bigint "pet_sitter_id_id", null: false
    t.bigint "client_id_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id_id"], name: "index_reviews_on_client_id_id"
    t.index ["pet_sitter_id_id"], name: "index_reviews_on_pet_sitter_id_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "pet_sitter_id_id", null: false
    t.string "name"
    t.text "description"
    t.decimal "price", precision: 10, scale: 2
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pet_sitter_id_id"], name: "index_services_on_pet_sitter_id_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "pet_type_id"
    t.boolean "admin"
    t.string "first_name"
    t.string "last_name"
    t.string "abn"
    t.text "about"
    t.string "address"
    t.integer "post_code"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "orders", "users", column: "client_id_id"
  add_foreign_key "orders", "users", column: "pet_sitter_id_id"
  add_foreign_key "pets", "pet_types", column: "pet_types_id"
  add_foreign_key "pets", "users", column: "client_id_id"
  add_foreign_key "reviews", "users", column: "client_id_id"
  add_foreign_key "reviews", "users", column: "pet_sitter_id_id"
  add_foreign_key "services", "users", column: "pet_sitter_id_id"
end

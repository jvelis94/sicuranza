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

ActiveRecord::Schema.define(version: 2019_08_13_212822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invoices", force: :cascade do |t|
    t.string "bill_to_info"
    t.string "description"
    t.date "date"
    t.date "job_date"
    t.integer "subtotal"
    t.integer "tax"
    t.integer "total"
    t.integer "payments_credits"
    t.integer "balance_remaining"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "work_order_id"
    t.index ["work_order_id"], name: "index_invoices_on_work_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_orders", force: :cascade do |t|
    t.string "technician"
    t.date "date"
    t.string "location"
    t.integer "hours"
    t.string "customer_name"
    t.string "customer_street_address"
    t.string "customer_city"
    t.string "customer_zip_code"
    t.string "customer_phone_number"
    t.string "customer_email"
    t.string "job_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_work_orders_on_user_id"
  end

  add_foreign_key "invoices", "work_orders"
  add_foreign_key "work_orders", "users"
end

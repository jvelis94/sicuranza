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

ActiveRecord::Schema.define(version: 2019_09_30_184434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "contractors", force: :cascade do |t|
    t.string "name"
    t.string "address1"
    t.string "city"
    t.string "state"
    t.bigint "zip"
    t.bigint "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "details", force: :cascade do |t|
    t.string "description"
    t.integer "amount"
    t.integer "invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "start"
    t.datetime "end"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.string "bill_to_info"
    t.date "date"
    t.date "job_date"
    t.integer "subtotal"
    t.decimal "tax"
    t.integer "total"
    t.integer "payments_credits"
    t.integer "balance_remaining"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "work_order_id"
    t.string "project_name"
    t.boolean "paid"
    t.string "notes"
    t.string "job_type"
    t.index ["work_order_id"], name: "index_invoices_on_work_order_id"
  end

  create_table "jobpunchlists", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "punchlistitems", force: :cascade do |t|
    t.string "content"
    t.bigint "jobpunchlist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "completed_at"
    t.index ["jobpunchlist_id"], name: "index_punchlistitems_on_jobpunchlist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
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
    t.string "state"
    t.index ["user_id"], name: "index_work_orders_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "invoices", "work_orders"
  add_foreign_key "punchlistitems", "jobpunchlists"
  add_foreign_key "work_orders", "users"
end

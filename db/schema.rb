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

ActiveRecord::Schema.define(version: 2023_01_06_174214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "number"
    t.date "due_date"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "business", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_jobs_on_customer_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "invoice_id"
    t.string "description"
    t.string "line_item_type"
    t.decimal "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "payment_id"
    t.bigint "self_id"
    t.index ["invoice_id"], name: "index_line_items_on_invoice_id"
    t.index ["job_id"], name: "index_line_items_on_job_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "payer_id"
    t.bigint "payee_id"
    t.decimal "amount"
    t.string "reference"
    t.string "type"
    t.datetime "initiated_at"
    t.datetime "completed_at"
  end

  add_foreign_key "jobs", "businesses", column: "customer_id"
  add_foreign_key "line_items", "invoices"
  add_foreign_key "line_items", "jobs"
end

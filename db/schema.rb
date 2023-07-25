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

ActiveRecord::Schema[7.0].define(version: 2023_07_25_061408) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "completed_orders", force: :cascade do |t|
    t.string "order_ref", null: false
    t.string "customer_ref", null: false
    t.float "total_in_cents"
    t.datetime "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_ref"], name: "index_completed_orders_on_customer_ref"
  end

  create_table "customer_tier_histories", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "yearly_period_id"
    t.integer "tier_id"
    t.float "spend_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id", "yearly_period_id"], name: "customer_period_index", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "customer_ref"
    t.string "name"
    t.integer "tier_id", null: false
    t.float "spend_amount"
    t.float "next_period_spend_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_ref"], name: "index_customers_on_customer_ref", unique: true
  end

  create_table "tiers", force: :cascade do |t|
    t.string "name"
    t.integer "rank"
    t.float "bottom_threshold"
    t.float "upper_threshold"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rank"], name: "index_tiers_on_rank"
  end

  create_table "yearly_periods", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["year"], name: "index_yearly_periods_on_year", unique: true
  end

  add_foreign_key "customer_tier_histories", "customers"
  add_foreign_key "customer_tier_histories", "tiers"
  add_foreign_key "customer_tier_histories", "yearly_periods"
  add_foreign_key "customers", "tiers"
end

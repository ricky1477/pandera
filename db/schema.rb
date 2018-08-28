# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20180828164013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "image"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "client_schedules", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "schedule_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "client_street_address"
    t.string   "time"
    t.string   "service_type"
    t.string   "notes"
    t.boolean  "done"
    t.integer  "service_id"
    t.decimal  "price"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.date     "dob"
    t.string   "city"
    t.string   "zipcode"
    t.string   "street_address"
    t.string   "sms_gateway"
    t.text     "notes"
    t.decimal  "credit"
    t.string   "state"
    t.string   "email2"
    t.string   "phone2"
    t.string   "sms_gateway2"
    t.boolean  "prospect"
    t.decimal  "lat",            precision: 10, scale: 6
    t.decimal  "lng",            precision: 10, scale: 6
  end

  create_table "estimates", force: :cascade do |t|
    t.string   "description"
    t.decimal  "price"
    t.integer  "client_id"
    t.text     "notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.decimal  "price"
    t.string   "description"
    t.string   "category"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "invoice_number"
    t.date     "maturity"
    t.text     "description"
    t.decimal  "total"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "paid"
    t.string   "check_number"
  end

  create_table "schedules", force: :cascade do |t|
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_types", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "services", force: :cascade do |t|
    t.date     "date"
    t.text     "description"
    t.decimal  "price"
    t.date     "maturity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "client_id"
    t.boolean  "paid"
    t.integer  "invoice_id"
    t.text     "notes"
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "is_default"
    t.string   "email"
    t.string   "phone"
  end

  add_foreign_key "services", "clients"
end

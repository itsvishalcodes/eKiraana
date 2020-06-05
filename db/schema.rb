# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_02_035912) do

  create_table "allorders", force: :cascade do |t|
    t.integer "quantity"
    t.integer "product_id", null: false
    t.integer "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_allorders_on_customer_id"
    t.index ["product_id"], name: "index_allorders_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "quantity"
    t.integer "customer_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_carts_on_customer_id"
    t.index ["product_id"], name: "index_carts_on_product_id"
  end

  create_table "customerpersonalinfos", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address"
    t.integer "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_customerpersonalinfos_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dealerpersonalinfos", force: :cascade do |t|
    t.string "shopname"
    t.integer "rating"
    t.integer "phone"
    t.string "review"
    t.integer "dealer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dealer_id"], name: "index_dealerpersonalinfos_on_dealer_id"
  end

  create_table "dealers", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pendingorders", force: :cascade do |t|
    t.integer "quantity"
    t.string "confkey"
    t.integer "product_id", null: false
    t.integer "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_pendingorders_on_customer_id"
    t.index ["product_id"], name: "index_pendingorders_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.text "tags"
    t.text "description"
    t.integer "dealer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dealer_id"], name: "index_products_on_dealer_id"
  end

  add_foreign_key "allorders", "customers"
  add_foreign_key "allorders", "products"
  add_foreign_key "carts", "customers"
  add_foreign_key "carts", "products"
  add_foreign_key "customerpersonalinfos", "customers"
  add_foreign_key "dealerpersonalinfos", "dealers"
  add_foreign_key "pendingorders", "customers"
  add_foreign_key "pendingorders", "products"
  add_foreign_key "products", "dealers"
end

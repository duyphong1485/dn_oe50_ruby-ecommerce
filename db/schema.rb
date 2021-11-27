ActiveRecord::Schema.define(version: 2021_11_29_095127) do

  create_table "accounts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "fullname"
    t.string "password"
    t.string "email"
    t.integer "role"
    t.boolean "is_active"
    t.string "remember"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "address", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "phone"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "account_id", null: false
    t.index ["account_id"], name: "index_address_on_account_id"
  end

  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "oder_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.float "price"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "oder_id", null: false
    t.bigint "product_id", null: false
    t.index ["oder_id"], name: "index_oder_details_on_oder_id"
    t.index ["product_id"], name: "index_oder_details_on_product_id"
  end

  create_table "oders", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "create_date"
    t.float "total_money"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "account_id", null: false
    t.bigint "address_id", null: false
    t.index ["account_id"], name: "index_oders_on_account_id"
    t.index ["address_id"], name: "index_oders_on_address_id"
  end

  create_table "products", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.float "price"
    t.datetime "create_date"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  add_foreign_key "address", "accounts"
  add_foreign_key "oder_details", "oders"
  add_foreign_key "oder_details", "products"
  add_foreign_key "oders", "accounts"
  add_foreign_key "oders", "address"
  add_foreign_key "products", "categories"
end

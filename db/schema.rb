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

ActiveRecord::Schema.define(version: 2020_01_06_171200) do

  create_table "buy_posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", null: false
    t.string "image_id"
    t.string "category", null: false
    t.string "brand", null: false
    t.integer "maximum_price", null: false
    t.integer "condition", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment", null: false
    t.boolean "status", default: true, null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "buy_post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offer_comments", force: :cascade do |t|
    t.integer "offer_id", null: false
    t.integer "user_id", null: false
    t.string "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.integer "buy_post_id", null: false
    t.integer "user_id", null: false
    t.string "title"
    t.integer "price", null: false
    t.string "image_id", null: false
    t.integer "condition", null: false
    t.text "comment", null: false
    t.boolean "public_status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trade_messages", force: :cascade do |t|
    t.integer "trade_id", null: false
    t.integer "user_id", null: false
    t.string "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trade_users", force: :cascade do |t|
    t.integer "trade_id", null: false
    t.integer "user_id", null: false
    t.boolean "finish_status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "side", null: false
  end

  create_table "trades", force: :cascade do |t|
    t.integer "offer_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_trades_on_offer_id", unique: true
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
    t.string "nick_name", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_read", null: false
    t.string "first_name_read", null: false
    t.string "phone_number", null: false
    t.string "postcode", null: false
    t.string "prefecture_code", null: false
    t.string "address_city", null: false
    t.string "address_street", null: false
    t.string "address_building"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "introduction"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

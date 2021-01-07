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

ActiveRecord::Schema.define(version: 2020_12_25_095927) do

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "item_name"
    t.string "item_s_name"
    t.string "item_s_branch"
    t.string "volume"
    t.text "comments"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "text", null: false
    t.bigint "user_id"
    t.bigint "negotiation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["negotiation_id"], name: "index_messages_on_negotiation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "negotiation_messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "negotiation_id"
    t.bigint "message_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message_id"], name: "index_negotiation_messages_on_message_id"
    t.index ["negotiation_id"], name: "index_negotiation_messages_on_negotiation_id"
  end

  create_table "negotiations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "store_id"
    t.bigint "user_id"
    t.integer "attributing_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_negotiations_on_item_id"
    t.index ["store_id"], name: "index_negotiations_on_store_id"
    t.index ["user_id"], name: "index_negotiations_on_user_id"
  end

  create_table "stores", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "s_name", null: false
    t.string "s_branch", null: false
    t.integer "prefecture_id", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_stores_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.string "f_name_kanji", default: "", null: false
    t.string "l_name_kanji", null: false
    t.string "f_name_kana", null: false
    t.string "l_name_kana", null: false
    t.date "birthday", null: false
    t.integer "postal_code", null: false
    t.integer "prefecture_id", null: false
    t.string "municipality", null: false
    t.string "town"
    t.string "chome"
    t.integer "phone_number", null: false
    t.integer "attributing_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_negotiations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "negotiation_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["negotiation_id"], name: "index_users_negotiations_on_negotiation_id"
    t.index ["user_id"], name: "index_users_negotiations_on_user_id"
  end

  add_foreign_key "items", "users"
  add_foreign_key "messages", "negotiations"
  add_foreign_key "messages", "users"
  add_foreign_key "negotiation_messages", "messages"
  add_foreign_key "negotiation_messages", "negotiations"
  add_foreign_key "negotiations", "items"
  add_foreign_key "negotiations", "stores"
  add_foreign_key "negotiations", "users"
  add_foreign_key "stores", "users"
  add_foreign_key "users_negotiations", "negotiations"
  add_foreign_key "users_negotiations", "users"
end

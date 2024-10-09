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

ActiveRecord::Schema[7.2].define(version: 2024_10_09_162025) do
  create_table "actions", force: :cascade do |t|
    t.string "action_type"
    t.integer "gas"
    t.string "deposit"
    t.string "method_name"
    t.integer "transaction_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transaction_id"], name: "index_actions_on_transaction_id"
  end

  create_table "blockchains", force: :cascade do |t|
    t.string "name"
    t.string "endpoint"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "gas_burnt"
    t.datetime "time"
    t.string "transaction_hash"
    t.string "block_hash"
    t.string "sender"
    t.string "receiver"
    t.bigint "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "blockchain_id"
  end

  add_foreign_key "actions", "transactions"
end

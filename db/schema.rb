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

ActiveRecord::Schema.define(version: 20180409184510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "request_cookies", force: :cascade do |t|
    t.integer "request_id", null: false
    t.string "key", null: false
    t.text "value"
  end

  create_table "request_headers", force: :cascade do |t|
    t.integer "request_id", null: false
    t.string "key", null: false
    t.text "value"
  end

  create_table "request_params", force: :cascade do |t|
    t.integer "request_id", null: false
    t.string "key", null: false
    t.text "value"
  end

  create_table "requests", force: :cascade do |t|
    t.string "query_string", null: false
    t.string "method", null: false
    t.string "remote_ip"
    t.text "scheme"
    t.datetime "created_at"
    t.index ["query_string"], name: "index_requests_on_query_string"
  end

end

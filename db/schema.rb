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

ActiveRecord::Schema.define(version: 2018_07_13_060331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "popular_times", force: :cascade do |t|
    t.integer "wait_time"
    t.integer "total_time_spent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "restaurant_id"
    t.index ["restaurant_id"], name: "index_popular_times_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "yelp_id"
    t.string "name"
    t.string "image_url"
    t.float "rating"
    t.string "price"
    t.float "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "categories", default: [], array: true
    t.text "location", default: [], array: true
    t.text "transactions", default: [], array: true
    t.string "latitude"
    t.string "longitude"
    t.string "yelp_url"
    t.integer "review_count"
    t.string "display_phone"
  end

  add_foreign_key "popular_times", "restaurants"
end

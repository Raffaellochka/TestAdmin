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

ActiveRecord::Schema[7.0].define(version: 2023_02_16_150153) do
  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "region_id", null: false
    t.index ["region_id"], name: "index_cities_on_region_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
  end

  create_table "hostels", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.string "region_name"
    t.string "city_name"
    t.integer "city_id", null: false
    t.index ["city_id"], name: "index_hostels_on_city_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.integer "country_id", null: false
    t.index ["country_id"], name: "index_regions_on_country_id"
  end

  add_foreign_key "cities", "regions"
  add_foreign_key "hostels", "cities"
  add_foreign_key "regions", "countries"
end

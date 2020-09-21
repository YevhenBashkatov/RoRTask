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

ActiveRecord::Schema.define(version: 2020_09_21_113437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "railway_carriages", force: :cascade do |t|
    t.string "number"
    t.string "carriage_type"
    t.integer "seats_up"
    t.integer "seats_down"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "train_id"
    t.index ["train_id"], name: "index_railway_carriages_on_train_id"
  end

  create_table "railway_station_routes", force: :cascade do |t|
    t.integer "railway_station_id"
    t.integer "route_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "railway_stations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "customer_id"
    t.bigint "train_id"
    t.bigint "first_station_id"
    t.bigint "last_station_id"
    t.index ["customer_id"], name: "index_tickets_on_customer_id"
    t.index ["first_station_id"], name: "index_tickets_on_first_station_id"
    t.index ["last_station_id"], name: "index_tickets_on_last_station_id"
    t.index ["train_id"], name: "index_tickets_on_train_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "current_station_id"
    t.bigint "route_id"
    t.index ["current_station_id"], name: "index_trains_on_current_station_id"
    t.index ["route_id"], name: "index_trains_on_route_id"
  end

end

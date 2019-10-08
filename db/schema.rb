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

ActiveRecord::Schema.define(version: 2019_10_08_140202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boat_profiles", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.string "hull_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hull_material"
    t.string "rigging_type"
    t.string "ballast_type"
    t.string "keel_type"
    t.string "windlass_type"
    t.string "certification"
    t.string "builder"
    t.string "designer"
    t.string "boat_type"
    t.string "boat_class"
    t.integer "cabins"
    t.integer "double_berths"
    t.integer "heads"
    t.float "length_on_deck"
    t.float "loa"
    t.float "lwl"
    t.float "beam"
    t.float "sail_area"
    t.float "max_draft"
    t.float "min_draft"
    t.float "displacement"
    t.float "ballast"
    t.float "comfort_ratio"
    t.float "cabin_headroom"
    t.float "dry_weight"
    t.float "max_bridge_clearance"
    t.float "rig_i"
    t.float "rig_j"
    t.float "rig_p"
    t.float "rig_e"
    t.float "rig_spl_tps"
    t.float "rig_isp"
    t.string "fuel_type"
    t.string "engine_make"
    t.string "engine_model"
    t.integer "horse_power"
    t.string "engine_type"
    t.string "drive_type"
    t.string "propeller_type"
    t.string "propeller_material"
    t.integer "engine_hours"
    t.integer "engine_year"
    t.boolean "folding_propeller"
    t.float "holding_tank_capacity"
    t.integer "holding_tank_number"
    t.string "holding_tank_material"
    t.float "water_tank_capacity"
    t.integer "water_tank_number"
    t.string "water_tank_material"
    t.float "fuel_tank_capacity"
    t.integer "fuel_tank_number"
    t.string "fuel_tank_material"
    t.float "sa_disp"
    t.float "bal_disp"
    t.float "disp_len"
    t.integer "first_built"
    t.integer "last_built"
    t.integer "number_built"
  end

  create_table "listing_prices", force: :cascade do |t|
    t.integer "ask_price"
    t.string "currency"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "listing_id"
    t.index ["listing_id"], name: "index_listing_prices_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "website"
    t.integer "website_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "boat_profile_id"
    t.string "hull_material"
    t.string "rigging_type"
    t.string "ballast_type"
    t.string "keel_type"
    t.string "windlass_type"
    t.string "certification"
    t.string "builder"
    t.string "designer"
    t.string "boat_type"
    t.string "boat_class"
    t.integer "cabins"
    t.integer "double_berths"
    t.integer "heads"
    t.float "length_on_deck"
    t.float "loa"
    t.float "lwl"
    t.float "beam"
    t.float "sail_area"
    t.float "max_draft"
    t.float "min_draft"
    t.float "displacement"
    t.float "ballast"
    t.float "comfort_ratio"
    t.float "cabin_headroom"
    t.float "dry_weight"
    t.float "max_bridge_clearance"
    t.float "rig_i"
    t.float "rig_j"
    t.float "rig_p"
    t.float "rig_e"
    t.float "rig_spl_tps"
    t.float "rig_isp"
    t.string "fuel_type"
    t.string "engine_make"
    t.string "engine_model"
    t.integer "horse_power"
    t.string "engine_type"
    t.string "drive_type"
    t.string "propeller_type"
    t.string "propeller_material"
    t.integer "engine_hours"
    t.integer "engine_year"
    t.boolean "folding_propeller"
    t.float "holding_tank_capacity"
    t.integer "holding_tank_number"
    t.string "holding_tank_material"
    t.float "water_tank_capacity"
    t.integer "water_tank_number"
    t.string "water_tank_material"
    t.float "fuel_tank_capacity"
    t.integer "fuel_tank_number"
    t.string "fuel_tank_material"
    t.float "sa_disp"
    t.float "bal_disp"
    t.float "disp_len"
    t.integer "first_built"
    t.integer "last_built"
    t.integer "number_built"
    t.string "location"
    t.string "seller"
    t.string "url"
    t.string "condition"
    t.string "tax_status"
    t.integer "year"
    t.string "make"
    t.string "model"
    t.index ["boat_profile_id"], name: "index_listings_on_boat_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "listing_prices", "listings"
  add_foreign_key "listings", "boat_profiles"
end

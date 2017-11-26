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

ActiveRecord::Schema.define(version: 20171028144223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "bottles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "opening_hours", force: :cascade do |t|
    t.string "title"
    t.string "value"
    t.bigint "setting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["setting_id"], name: "index_opening_hours_on_setting_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "url"
    t.string "logo"
    t.text "description"
    t.text "address"
    t.string "email"
    t.float "long"
    t.float "lat"
    t.string "facebook"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "opening_hours"
    t.string "vk"
    t.string "instagram"
    t.string "sales_phone"
    t.string "sales_name"
    t.string "sales_email"
    t.string "visit_phone"
    t.string "visit_name"
    t.string "visit_email"
    t.text "post_address"
  end

  create_table "vintages", force: :cascade do |t|
    t.bigint "wine_id"
    t.string "title"
    t.string "subtitle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "background_color"
    t.integer "sortable"
    t.index ["slug"], name: "index_vintages_on_slug", unique: true
    t.index ["wine_id"], name: "index_vintages_on_wine_id"
  end

  create_table "wines", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "harvest_year"
    t.integer "bottle_amount"
    t.string "spirit"
    t.string "oxygen"
    t.string "aroma"
    t.string "looks"
    t.string "taste"
    t.text "recommendations"
    t.string "aging_period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo"
    t.bigint "vintage_id"
    t.string "year"
    t.string "slug"
    t.string "speciality"
    t.index ["slug"], name: "index_wines_on_slug", unique: true
    t.index ["vintage_id"], name: "index_wines_on_vintage_id"
  end

  add_foreign_key "opening_hours", "settings"
  add_foreign_key "vintages", "wines"
  add_foreign_key "wines", "vintages"
end

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

ActiveRecord::Schema.define(version: 2019_02_10_020613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "titles", force: :cascade do |t|
    t.string "name", null: false
    t.string "nickname", null: false
    t.string "slug", null: false
    t.string "developer", null: false
    t.integer "priority", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_titles_on_slug"
  end

  create_table "tournaments", force: :cascade do |t|
    t.bigint "title_id", null: false
    t.string "name", null: false
    t.date "starts", null: false
    t.date "ends"
    t.string "logo_uri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title_id", "starts"], name: "index_tournaments_on_title_id_and_starts"
    t.index ["title_id"], name: "index_tournaments_on_title_id"
  end

  add_foreign_key "tournaments", "titles"
end

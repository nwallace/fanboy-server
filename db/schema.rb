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

ActiveRecord::Schema.define(version: 2019_02_19_030320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competitors", force: :cascade do |t|
    t.bigint "title_id", null: false
    t.string "name", null: false
    t.string "logo_uri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title_id"], name: "index_competitors_on_title_id"
  end

  create_table "maps", force: :cascade do |t|
    t.bigint "title_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title_id"], name: "index_maps_on_title_id"
  end

  create_table "match_participations", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.bigint "competitor_id", null: false
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competitor_id"], name: "index_match_participations_on_competitor_id"
    t.index ["match_id"], name: "index_match_participations_on_match_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "round_id", null: false
    t.bigint "map_id", null: false
    t.integer "best_of", null: false
    t.integer "sort_order", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["map_id"], name: "index_matches_on_map_id"
    t.index ["round_id"], name: "index_matches_on_round_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.bigint "tournament_id", null: false
    t.string "name", null: false
    t.integer "sort_order", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id", "sort_order"], name: "index_rounds_on_tournament_id_and_sort_order", unique: true
    t.index ["tournament_id"], name: "index_rounds_on_tournament_id"
  end

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

  add_foreign_key "competitors", "titles"
  add_foreign_key "maps", "titles"
  add_foreign_key "match_participations", "competitors"
  add_foreign_key "match_participations", "matches"
  add_foreign_key "matches", "maps"
  add_foreign_key "matches", "rounds"
  add_foreign_key "rounds", "tournaments"
  add_foreign_key "tournaments", "titles"
end

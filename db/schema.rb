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

ActiveRecord::Schema.define(version: 2020_03_22_175229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mission_teams", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_mission_teams_on_game_id"
  end

  create_table "missions", force: :cascade do |t|
    t.string "status", limit: 256
    t.integer "num_players", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_missions_on_game_id"
  end

  create_table "team_members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "mission_team_id", null: false
    t.string "result", limit: 256
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mission_team_id"], name: "index_team_members_on_mission_team_id"
    t.index ["user_id"], name: "index_team_members_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 256, null: false
    t.string "password_digest", limit: 256
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "identity", limit: 256, null: false
    t.index ["game_id"], name: "index_users_on_game_id"
  end

  add_foreign_key "team_members", "mission_teams"
  add_foreign_key "team_members", "users"
end

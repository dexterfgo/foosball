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

ActiveRecord::Schema.define(version: 20170530202113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer "white_team"
    t.integer "black_team"
    t.string "game_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "white_team_first_player"
    t.integer "white_team_second_player"
    t.integer "black_team_first_player"
    t.integer "black_team_second_player"
    t.integer "result"
  end

  create_table "player_results", force: :cascade do |t|
    t.integer "gameid"
    t.integer "playerid"
    t.integer "teammate"
    t.integer "team"
    t.integer "opponent"
    t.boolean "won"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.integer "first_player"
    t.integer "second_player"
    t.integer "score"
    t.string "name"
    t.boolean "win"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

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

ActiveRecord::Schema[8.0].define(version: 2025_04_17_171811) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.string "artist"
    t.text "tracklist", default: [], array: true
    t.string "cover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "summary"
    t.text "genre_tags", default: [], array: true
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "listen_id", null: false
    t.bigint "user_id", null: false
    t.bigint "album_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_likes_on_album_id"
    t.index ["listen_id"], name: "index_likes_on_listen_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "listens", force: :cascade do |t|
    t.bigint "album_id", null: false
    t.bigint "user_id", null: false
    t.integer "rating"
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_listens_on_album_id"
    t.index ["user_id"], name: "index_listens_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "bio"
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "likes", "albums"
  add_foreign_key "likes", "listens"
  add_foreign_key "likes", "users"
  add_foreign_key "listens", "albums"
  add_foreign_key "listens", "users"
  add_foreign_key "sessions", "users"
end

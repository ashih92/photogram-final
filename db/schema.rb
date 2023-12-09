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

ActiveRecord::Schema[7.0].define(version: 2023_12_09_202047) do
  create_table "comments", force: :cascade do |t|
    t.integer "author_id"
    t.text "body"
    t.integer "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follow_requests", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "sender_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "fan_id"
    t.integer "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photograms", force: :cascade do |t|
    t.string "user"
    t.text "comment"
    t.string "follow_request"
    t.integer "like"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.text "caption"
    t.integer "comments_count"
    t.string "image"
    t.integer "likes_count"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "comments_count"
    t.string "email"
    t.string "encrypted_password"
    t.integer "likes_count"
    t.boolean "private"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email_devise", default: "", null: false
    t.string "encrypted_passworddevise", default: "", null: false
    t.string "reset_password_token_devise"
    t.datetime "reset_password_sent_at_devise"
    t.datetime "remember_created_at_devise"
    t.integer "comments_count_devise"
    t.integer "likescount_devise"
    t.boolean "private_devise"
    t.string "username_devise"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

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

ActiveRecord::Schema.define(version: 20171127035242) do

  create_table "advices", force: :cascade do |t|
    t.integer "spot_id"
    t.string "picture"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "lat"
    t.float "lng"
    t.integer "user_id"
    t.integer "likes_count", default: 0, null: false
    t.index ["spot_id"], name: "index_advices_on_spot_id"
    t.index ["user_id"], name: "index_advices_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "advice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advice_id"], name: "index_comments_on_advice_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "advice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advice_id"], name: "index_likes_on_advice_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "mylists", force: :cascade do |t|
    t.integer "spot_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_mylists_on_spot_id"
    t.index ["user_id"], name: "index_mylists_on_user_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "place_name"
    t.float "lat"
    t.float "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "detail_comment"
    t.integer "create_user_id"
    t.index ["create_user_id"], name: "index_spots_on_create_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

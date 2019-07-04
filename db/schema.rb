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

ActiveRecord::Schema.define(version: 2019_06_07_155418) do

  create_table "establishments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "good_tags", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "good_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["good_id"], name: "index_good_tags_on_good_id"
    t.index ["tag_id"], name: "index_good_tags_on_tag_id"
  end

  create_table "goods", force: :cascade do |t|
    t.string "name"
    t.integer "occupant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description", default: ""
  end

  create_table "occupants", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.integer "establishment_id", default: 1
    t.string "username"
    t.string "avatar_url"
    t.string "email"
    t.string "uid"
    t.string "provider"
    t.string "oauth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

  create_table "shop_tags", force: :cascade do |t|
    t.integer "shop_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_shop_tags_on_shop_id"
    t.index ["tag_id"], name: "index_shop_tags_on_tag_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "address", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

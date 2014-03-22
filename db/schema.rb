# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140321192755) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "dishes", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price",       precision: 10, scale: 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "dishes", ["user_id"], name: "index_dishes_on_user_id_and_image_id", using: :btree

  create_table "dishes_menu_categories", id: false, force: true do |t|
    t.integer "dish_id"
    t.integer "menu_category_id"
  end

  add_index "dishes_menu_categories", ["dish_id", "menu_category_id"], name: "index_dishes_menu_categories_on_dish_id_and_menu_category_id", using: :btree

  create_table "gallery_images", force: true do |t|
    t.string   "alt"
    t.integer  "user_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gallery_images", ["user_id"], name: "index_gallery_images_on_user_id_and_image_id_and_thumbnail_id", using: :btree

  create_table "images", force: true do |t|
  end

  create_table "menu_categories", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menu_categories", ["user_id"], name: "index_menu_categories_on_user_id", using: :btree

  create_table "reservations", force: true do |t|
    t.datetime "reservation_date"
    t.string   "telephone_number"
    t.integer  "number_of_people"
    t.boolean  "allowed"
    t.integer  "user_id"
    t.datetime "created_at"
  end

  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "access_rights"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

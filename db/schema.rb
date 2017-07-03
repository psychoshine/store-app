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

ActiveRecord::Schema.define(version: 20170608133920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_confirms", force: :cascade do |t|
    t.integer  "shopping_cart_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "shop_item_id"
    t.integer  "quantity",                                  default: 1
    t.integer  "shopping_cart_id"
    t.decimal  "shop_price",       precision: 12, scale: 2
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  create_table "contact_us", force: :cascade do |t|
    t.string   "email"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "fb"
    t.string   "insta"
    t.string   "vk"
    t.string   "phone"
    t.string   "phone2"
    t.string   "phone3"
    t.text     "description"
    t.text     "description2"
    t.string   "adress"
    t.string   "adress2"
    t.string   "twitter"
    t.string   "email"
    t.text     "how_to_get"
    t.text     "how_to_get2"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "main_shots", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "description2"
    t.string   "title2"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "shop_items", force: :cascade do |t|
    t.string   "title1"
    t.string   "title2"
    t.text     "description1"
    t.text     "description2"
    t.decimal  "price",                   precision: 12, scale: 2
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "shop_image_file_name"
    t.string   "shop_image_content_type"
    t.integer  "shop_image_file_size"
    t.datetime "shop_image_updated_at"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_contacts", force: :cascade do |t|
    t.integer  "shopping_cart_id"
    t.integer  "user_id"
    t.string   "state"
    t.integer  "zip_code"
    t.string   "adress"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "city"
    t.string   "full_name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

end

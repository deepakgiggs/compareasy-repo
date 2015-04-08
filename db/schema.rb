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

ActiveRecord::Schema.define(version: 20150407205111) do

  create_table "search_products", force: :cascade do |t|
    t.string   "product_id"
    t.string   "product_title"
    t.string   "product_owner"
    t.string   "product_url"
    t.string   "product_categories"
    t.string   "product_image"
    t.string   "product_description"
    t.string   "product_retail_price"
    t.string   "product_selling_price"
    t.string   "product_brand"
    t.string   "product_color"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end

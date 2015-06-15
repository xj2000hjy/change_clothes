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

ActiveRecord::Schema.define(version: 20150611071237) do

  create_table "address_books", force: :cascade do |t|
    t.string   "username",            limit: 255
    t.string   "password",            limit: 255
    t.string   "password_salt",       limit: 255
    t.string   "name",                limit: 255
    t.integer  "sex",                 limit: 4,   default: -1
    t.string   "head_portrait",       limit: 255
    t.string   "birthday",            limit: 255
    t.integer  "age",                 limit: 4
    t.string   "telephone",           limit: 255
    t.string   "mobile",              limit: 255
    t.string   "qq",                  limit: 255
    t.string   "email",               limit: 255
    t.string   "weixin",              limit: 255
    t.string   "birth_province_code", limit: 255
    t.string   "birth_city_code",     limit: 255
    t.string   "birth_area_code",     limit: 255
    t.string   "live_province_code",  limit: 255
    t.string   "live_city_code",      limit: 255
    t.string   "live_area_code",      limit: 255
    t.string   "ip",                  limit: 255
    t.string   "login_address",       limit: 255
    t.integer  "login_count",         limit: 4,   default: 0
    t.boolean  "is_valid",            limit: 1,   default: true
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "area", force: :cascade do |t|
    t.string "code",     limit: 6,  null: false
    t.string "name",     limit: 20, null: false
    t.string "citycode", limit: 6,  null: false
  end

  create_table "city", force: :cascade do |t|
    t.string "code",         limit: 6,  null: false
    t.string "name",         limit: 20, null: false
    t.string "provincecode", limit: 6,  null: false
  end

  create_table "province", force: :cascade do |t|
    t.string "code", limit: 6,  null: false
    t.string "name", limit: 20, null: false
  end

end

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

ActiveRecord::Schema.define(version: 20140609165954) do

  create_table "admins", force: true do |t|
    t.string "username"
    t.string "password_digest"
  end

  create_table "names", force: true do |t|
    t.string "arabic_name"
    t.string "english_transliteration"
    t.string "img"
    t.text   "etymology"
    t.text   "article"
    t.string "triliteral_root"
    t.text   "dictionary_definition"
  end

  create_table "users", force: true do |t|
    t.string  "phone_number"
    t.string  "frequency"
    t.integer "name_count"
  end

end

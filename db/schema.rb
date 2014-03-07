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

ActiveRecord::Schema.define(version: 20140307185856) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expertises", force: true do |t|
    t.integer  "subject_id"
    t.integer  "provider_id"
    t.integer  "experience"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", force: true do |t|
    t.string   "first_name"
    t.string   "middle_initial"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "cell"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "rate"
    t.string   "position"
    t.string   "organization"
    t.integer  "years_experience"
    t.text     "resume"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subject_areas", force: true do |t|
    t.string   "name"
    t.boolean  "is_technical"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.integer  "subject_area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

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

ActiveRecord::Schema.define(version: 20160720140606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bill_comments", force: :cascade do |t|
    t.string   "author"
    t.text     "content"
    t.integer  "bill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_bill_comments_on_bill_id", using: :btree
  end

  create_table "bills", force: :cascade do |t|
    t.string   "bill_id_from_api"
    t.string   "bill_type"
    t.string   "chamber"
    t.integer  "congress"
    t.json     "history"
    t.date     "introduced"
    t.date     "last_action"
    t.date     "last_vote"
    t.json     "last_version"
    t.string   "official_title"
    t.string   "popular_title"
    t.string   "short_title"
    t.json     "sponsor"
    t.string   "sponsor_bio_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "legislator_comments", force: :cascade do |t|
    t.string   "author"
    t.text     "content"
    t.integer  "legislator_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["legislator_id"], name: "index_legislator_comments_on_legislator_id", using: :btree
  end

  create_table "legislators", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "party"
    t.integer  "year_elected"
    t.string   "bio_id"
    t.string   "chamber"
    t.integer  "number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "votes", force: :cascade do |t|
    t.string   "vote_type"
    t.string   "chamber"
    t.string   "congress"
    t.date     "voted_at"
    t.string   "bill_id"
    t.string   "roll_id"
    t.integer  "year"
    t.string   "result"
    t.json     "voter_ids"
    t.integer  "bills_id"
    t.integer  "legislators_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["bills_id"], name: "index_votes_on_bills_id", using: :btree
    t.index ["legislators_id"], name: "index_votes_on_legislators_id", using: :btree
  end

end

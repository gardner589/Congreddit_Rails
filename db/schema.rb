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
    # AM: This is a down-the-road sort of thing, but there are lots of opportunities for many-to-many relationships in this application.
    # AM: It seems to me that sponsorships could be a join table between bills and legislators. It's a very specific way in which many legislators could be tied to many bills, and vice-versa.
    # AM: Implementing that would help clean up your bills schema (and probably other ones).
    t.json     "sponsor"
    t.string   "sponsor_bio_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  # AM: Noticing your bill and legislator_comment table are pretty much the save, with the exception of your foreign key.
  # AM: One way to refactor your database is to have a single comments table, with no foreign key on it. This model would have a many-to-many relationship with both bill and legislator_comments.
  # AM: That means you would have two join tables. Each of those would be responsible for matching a comment_id with a bill_id or legislator_id.
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

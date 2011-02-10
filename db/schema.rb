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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110209175452) do

  create_table "cal_event_cats", :force => true do |t|
    t.integer  "uid"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "installations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "venue_id"
    t.integer  "release"
    t.integer  "migration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jsonfiles", :force => true do |t|
    t.string   "filename"
    t.text     "description"
    t.text     "jsonparse"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "map_images", :force => true do |t|
    t.string   "mapType"
    t.integer  "uid"
    t.string   "name"
    t.text     "description"
    t.decimal  "low_left_lat"
    t.decimal  "low_left_long"
    t.decimal  "up_left_lat"
    t.decimal  "up_left_long"
    t.decimal  "up_right_lat"
    t.decimal  "up_right_long"
    t.decimal  "low_right_lat"
    t.decimal  "low_right_long"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "map_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poi_cats", :force => true do |t|
    t.integer  "uid"
    t.integer  "mapuid"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pois", :force => true do |t|
    t.integer  "uid"
    t.string   "name"
    t.text     "description"
    t.integer  "poi_cat"
    t.decimal  "lattitude",   :precision => 9, :scale => 3
    t.decimal  "longitude",   :precision => 9, :scale => 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", :force => true do |t|
    t.integer  "uid"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_28_135242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "forced_rates", force: :cascade do |t|
    t.decimal "rate", precision: 5, scale: 3, null: false
    t.datetime "show_until", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rate"], name: "index_forced_rates_on_rate", unique: true
    t.index ["show_until"], name: "index_forced_rates_on_show_until"
  end

  create_table "rates", force: :cascade do |t|
    t.decimal "value", precision: 5, scale: 3, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end

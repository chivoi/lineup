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

ActiveRecord::Schema.define(version: 2021_03_04_025707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.bigint "gig_id", null: false
    t.bigint "profile_id", null: false
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gig_id"], name: "index_applications_on_gig_id"
    t.index ["profile_id"], name: "index_applications_on_profile_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gig_features", force: :cascade do |t|
    t.bigint "gig_id", null: false
    t.bigint "feature_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["feature_id"], name: "index_gig_features_on_feature_id"
    t.index ["gig_id"], name: "index_gig_features_on_gig_id"
  end

  create_table "gig_styles", force: :cascade do |t|
    t.bigint "gig_id", null: false
    t.bigint "style_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gig_id"], name: "index_gig_styles_on_gig_id"
    t.index ["style_id"], name: "index_gig_styles_on_style_id"
  end

  create_table "gigs", force: :cascade do |t|
    t.date "date"
    t.string "time"
    t.string "venue"
    t.string "location"
    t.text "description"
    t.bigint "musictype_id", null: false
    t.integer "set_length"
    t.money "tickets_presale", scale: 2
    t.money "door_charge", scale: 2
    t.integer "payment"
    t.boolean "filled"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["musictype_id"], name: "index_gigs_on_musictype_id"
    t.index ["user_id"], name: "index_gigs_on_user_id"
  end

  create_table "musictypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profile_styles", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "style_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_profile_styles_on_profile_id"
    t.index ["style_id"], name: "index_profile_styles_on_style_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "playtime"
    t.bigint "musictype_id", null: false
    t.text "demolinks"
    t.string "location"
    t.boolean "teamups"
    t.text "bio"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["musictype_id"], name: "index_profiles_on_musictype_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applications", "gigs"
  add_foreign_key "applications", "profiles"
  add_foreign_key "gig_features", "features"
  add_foreign_key "gig_features", "gigs"
  add_foreign_key "gig_styles", "gigs"
  add_foreign_key "gig_styles", "styles"
  add_foreign_key "gigs", "musictypes"
  add_foreign_key "gigs", "users"
  add_foreign_key "profile_styles", "profiles"
  add_foreign_key "profile_styles", "styles"
  add_foreign_key "profiles", "musictypes"
  add_foreign_key "profiles", "users"
end

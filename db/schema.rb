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

ActiveRecord::Schema[8.0].define(version: 2025_01_30_115116) do
  create_table "cold_emails", force: :cascade do |t|
    t.integer "goal", null: false
    t.string "goal_details", null: false
    t.text "email_content", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipients", force: :cascade do |t|
    t.string "name", null: false
    t.string "title", null: false
    t.string "organization", null: false
    t.string "organization_website", null: false
    t.text "personalization_hints"
    t.integer "type_of_recipient"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "senders", force: :cascade do |t|
    t.string "name", null: false
    t.string "title", null: false
    t.string "organization", null: false
    t.string "organization_website", null: false
    t.text "contact_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end

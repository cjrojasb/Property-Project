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

ActiveRecord::Schema.define(version: 20171101212758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "region_id"
    t.string   "province"
    t.index ["region_id"], name: "index_communes_on_region_id", using: :btree
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "property_equipments", force: :cascade do |t|
    t.integer  "publication_id"
    t.integer  "equipment_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["equipment_id"], name: "index_property_equipments_on_equipment_id", using: :btree
    t.index ["publication_id"], name: "index_property_equipments_on_publication_id", using: :btree
  end

  create_table "publication_attachments", force: :cascade do |t|
    t.string   "photo"
    t.integer  "publication_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["publication_id"], name: "index_publication_attachments_on_publication_id", using: :btree
  end

  create_table "publications", force: :cascade do |t|
    t.string   "title"
    t.integer  "bedroom"
    t.integer  "bath"
    t.integer  "parking"
    t.text     "description"
    t.integer  "price"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
    t.integer  "commune_id"
    t.integer  "category_id"
    t.integer  "type_id"
    t.integer  "region_id"
    t.integer  "page_views",  default: 0
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["category_id"], name: "index_publications_on_category_id", using: :btree
    t.index ["commune_id"], name: "index_publications_on_commune_id", using: :btree
    t.index ["region_id"], name: "index_publications_on_region_id", using: :btree
    t.index ["type_id"], name: "index_publications_on_type_id", using: :btree
    t.index ["user_id"], name: "index_publications_on_user_id", using: :btree
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "phone"
    t.integer  "role",                   default: 1
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "communes", "regions"
  add_foreign_key "property_equipments", "equipment"
  add_foreign_key "property_equipments", "publications"
  add_foreign_key "publication_attachments", "publications"
  add_foreign_key "publications", "categories"
  add_foreign_key "publications", "communes"
  add_foreign_key "publications", "regions"
  add_foreign_key "publications", "types"
  add_foreign_key "publications", "users"
end

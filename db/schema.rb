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

ActiveRecord::Schema.define(version: 20151213213559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.integer  "org_person_id"
    t.integer  "org_product_id"
    t.string   "name",                                                  null: false
    t.float    "tax_amount",                              default: 0.0
    t.decimal  "price",           precision: 5, scale: 2,               null: false
    t.string   "grocer",                                                null: false
    t.integer  "quantity",                                              null: false
    t.decimal  "weight_in_grams",                                       null: false
    t.datetime "expiry_date",                                           null: false
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  create_table "org_companies", force: :cascade do |t|
    t.string   "name",             null: false
    t.string   "avatar"
    t.text     "description"
    t.string   "verification_doc"
    t.boolean  "verified"
    t.integer  "typ_fee_id"
    t.integer  "typ_company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "org_companies_contacts", force: :cascade do |t|
    t.integer "org_company_id", null: false
    t.integer "org_contact_id", null: false
  end

  create_table "org_contacts", force: :cascade do |t|
    t.string   "address1",        null: false
    t.string   "address2"
    t.string   "city",            null: false
    t.string   "postal_code",     null: false
    t.string   "email",           null: false
    t.string   "business_number", null: false
    t.string   "cell_number"
    t.float    "latitude",        null: false
    t.float    "longitude",       null: false
    t.string   "avatar"
    t.integer  "typ_contact_id"
    t.integer  "typ_country_id"
    t.integer  "typ_region_id"
    t.integer  "org_company_id"
    t.integer  "org_person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "org_contacts_people", force: :cascade do |t|
    t.integer  "org_person_id",  null: false
    t.integer  "org_contact_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "org_people", force: :cascade do |t|
    t.integer  "typ_position_id"
    t.integer  "org_company_id"
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "stripe_publishable_key"
    t.string   "stripe_secret_key"
    t.string   "stripe_user_id"
    t.string   "stripe_currency"
    t.string   "stripe_account_type"
    t.text     "stripe_account_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "org_people", ["confirmation_token"], name: "index_org_people_on_confirmation_token", unique: true, using: :btree
  add_index "org_people", ["email"], name: "index_org_people_on_email", unique: true, using: :btree
  add_index "org_people", ["reset_password_token"], name: "index_org_people_on_reset_password_token", unique: true, using: :btree

  create_table "org_products", force: :cascade do |t|
    t.integer  "org_company_id"
    t.integer  "typ_category_id"
    t.integer  "typ_subcategory_id"
    t.string   "name",                                                         null: false
    t.text     "description",                                                  null: false
    t.decimal  "weight_in_grams",                                              null: false
    t.decimal  "price",                  precision: 5, scale: 2,               null: false
    t.integer  "available_quantity",                                           null: false
    t.datetime "expiry_date",                                                  null: false
    t.float    "latitude",                                                     null: false
    t.float    "longitude",                                                    null: false
    t.boolean  "online_order_available",                                       null: false
    t.float    "tax_amount",                                     default: 0.0
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preferred_deliverers", force: :cascade do |t|
    t.integer "deliverer_id", null: false
    t.integer "supplier_id",  null: false
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.string   "first_name",   null: false
    t.string   "last_name",    null: false
    t.string   "address1",     null: false
    t.string   "address2"
    t.string   "city",         null: false
    t.string   "region",       null: false
    t.string   "postal_code",  null: false
    t.string   "country",      null: false
    t.string   "telephone"
    t.string   "email"
    t.text     "description"
    t.integer  "trx_order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stripe_transactions", force: :cascade do |t|
    t.integer  "trx_order_id"
    t.string   "txn_type"
    t.string   "currency"
    t.decimal  "total_amount",        precision: 20, scale: 4
    t.decimal  "tax_amount",          precision: 20, scale: 4
    t.text     "notification_params"
    t.string   "txn_id"
    t.string   "status"
    t.string   "description"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "trx_order_fees", force: :cascade do |t|
    t.float   "fee_amount",   null: false
    t.integer "trx_order_id"
  end

  create_table "trx_order_items", force: :cascade do |t|
    t.string   "name",                                         null: false
    t.string   "description"
    t.decimal  "weight_in_grams",                              null: false
    t.decimal  "price",               precision: 20, scale: 4, null: false
    t.decimal  "available_quantity",                           null: false
    t.integer  "quantity",                                     null: false
    t.datetime "expiry_date",                                  null: false
    t.string   "image",                                        null: false
    t.integer  "org_company_id"
    t.integer  "org_product_id"
    t.integer  "typ_category_id"
    t.integer  "typ_subcategory_id"
    t.integer  "trx_order_id"
    t.integer  "shipping_address_id"
    t.decimal  "net_amount",          precision: 20, scale: 4
    t.decimal  "tax_amount",          precision: 20, scale: 4
    t.boolean  "delivery_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trx_orders", force: :cascade do |t|
    t.integer  "org_company_id"
    t.integer  "bill_to_contact_id"
    t.integer  "ship_to_contact_id"
    t.integer  "trx_order_fee_id"
    t.decimal  "total_amount",       precision: 20, scale: 4
    t.datetime "purchased_at"
    t.string   "transport_method"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "typ_categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "typ_companies", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "typ_contacts", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "typ_countries", force: :cascade do |t|
    t.string "iso"
    t.string "iso3"
    t.string "fips"
    t.string "country"
    t.string "continent"
    t.string "currency_code"
    t.string "currency_name"
    t.string "phone_prefix"
    t.string "postal_code"
    t.string "languages"
    t.string "geonameid"
  end

  create_table "typ_fees", force: :cascade do |t|
    t.string   "name",           null: false
    t.float    "fee_percentage", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "typ_positions", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "typ_regions", force: :cascade do |t|
    t.string   "name"
    t.string   "timezone"
    t.integer  "typ_country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "typ_sales_taxes", force: :cascade do |t|
    t.float    "tax_rate",      null: false
    t.integer  "typ_region_id"
    t.integer  "typ_tax_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "typ_subcategories", force: :cascade do |t|
    t.string  "name"
    t.integer "typ_category_id"
  end

  create_table "typ_taxes", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end

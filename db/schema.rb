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

ActiveRecord::Schema.define(version: 20160503075854) do

  create_table 'feedbacks', force: :cascade do |t|
    t.text     'name',         limit: 65_535
    t.text     'address',      limit: 65_535
    t.text     'descriptions', limit: 65_535
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'orders', force: :cascade do |t|
    t.text     'orders_input', limit: 65_535
    t.text     'name',         limit: 65_535
    t.text     'phone',        limit: 65_535
    t.text     'address',      limit: 65_535
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'products', force: :cascade do |t|
    t.string   'title',         limit: 255
    t.text     'description',   limit: 65_535
    t.decimal  'price',                       precision: 10
    t.decimal  'size',                        precision: 10
    t.boolean  'is_spicy',                                   default: false
    t.boolean  'is_veg',                                     default: false
    t.boolean  'is_best_offer',                              default: false
    t.string   'path_to_image', limit: 255
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end
end

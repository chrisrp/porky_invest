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

ActiveRecord::Schema.define(version: 20141130132042) do

  create_table "indices_diarios", force: true do |t|
    t.float "taxa_di"
    t.date  "data"
    t.float "taxa_selic"
  end

  add_index "indices_diarios", ["data"], name: "index_indices_diarios_on_data", unique: true

  create_table "usuarios", force: true do |t|
    t.string   "nome",       limit: 50
    t.string   "email",      limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true

end

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

ActiveRecord::Schema.define(version: 20140626223635) do

  create_table "calls", force: true do |t|
    t.string   "description"
    t.integer  "service_id"
    t.string   "files"
    t.integer  "client_id"
    t.time     "h_trabalhadas"
    t.integer  "colaborador_id"
    t.string   "estado"
    t.integer  "escalonado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "calls", ["client_id"], name: "index_calls_on_client_id", using: :btree
  add_index "calls", ["colaborador_id"], name: "index_calls_on_colaborador_id", using: :btree
  add_index "calls", ["service_id"], name: "index_calls_on_service_id", using: :btree

  create_table "calls_services", force: true do |t|
    t.integer "call_id"
    t.integer "service_id"
  end

  add_index "calls_services", ["call_id"], name: "index_calls_services_on_call_id", using: :btree
  add_index "calls_services", ["service_id"], name: "index_calls_services_on_service_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "nome"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.integer  "user_id"
    t.string   "occupation"
    t.integer  "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colaboradors", force: true do |t|
    t.integer  "user_id"
    t.integer  "perfil_id"
    t.integer  "cpf"
    t.string   "telefone"
    t.string   "endereco"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "colaboradors", ["user_id"], name: "index_colaboradors_on_user_id", using: :btree

  create_table "colaboradors_calls", force: true do |t|
    t.integer  "colaborador_id"
    t.integer  "call_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ics", force: true do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ics_services", force: true do |t|
    t.integer  "ic_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ics_services", ["ic_id"], name: "index_ics_services_on_ic_id", using: :btree
  add_index "ics_services", ["service_id"], name: "index_ics_services_on_service_id", using: :btree

  create_table "incidentes", force: true do |t|
    t.integer  "call_id"
    t.string   "comentario"
    t.string   "anexo"
    t.integer  "colaborador_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "incidentes", ["call_id"], name: "index_incidentes_on_call_id", using: :btree
  add_index "incidentes", ["colaborador_id"], name: "index_incidentes_on_colaborador_id", using: :btree

  create_table "perfils", force: true do |t|
    t.string   "nome"
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "name"
    t.integer  "number"
    t.integer  "category_id"
    t.string   "description"
    t.integer  "ic_id"
    t.time     "tempo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["ic_id"], name: "index_services_on_ic_id", using: :btree

  create_table "solutions", force: true do |t|
    t.integer  "call_id"
    t.string   "comentario"
    t.string   "anexo"
    t.integer  "colaborador_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "solutions", ["call_id"], name: "index_solutions_on_call_id", using: :btree
  add_index "solutions", ["colaborador_id"], name: "index_solutions_on_colaborador_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "nome"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

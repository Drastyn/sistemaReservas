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

ActiveRecord::Schema.define(version: 2019_01_04_213829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "habitacions", force: :cascade do |t|
    t.text "descripcionHabitacion"
    t.integer "numeroPersonas"
    t.string "tipoHabitacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "estado_habitacion", default: 0
    t.integer "tarifa_habitacion", default: 10000
  end

  create_table "reservas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "habitacions_id"
    t.bigint "users_id"
    t.date "fecha_ingreso"
    t.date "fecha_salida"
    t.index ["habitacions_id"], name: "index_reservas_on_habitacions_id"
    t.index ["users_id"], name: "index_reservas_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nombres_apellidos"
    t.string "nick_name"
    t.string "direccion"
    t.string "telefono"
    t.date "fecha_nacimiento"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_role", default: 0
    t.integer "estado_user", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "reservas", "habitacions", column: "habitacions_id"
  add_foreign_key "reservas", "users", column: "users_id"
end

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

ActiveRecord::Schema.define(version: 2018_11_26_231235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administradors", force: :cascade do |t|
    t.string "nombreAdministrador"
    t.string "apellidosAdministrador"
    t.string "rutAdministrador"
    t.string "claveAnterior"
    t.string "claveActual"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string "rutCliente"
    t.string "nombresCliente"
    t.string "emailCliente"
    t.datetime "fechaNacimiento"
    t.string "nickName"
    t.string "contraseñaCliente"
    t.string "direccionCliente"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "habitacions", force: :cascade do |t|
    t.text "descripcionHabitacion"
    t.integer "numeroPersonas"
    t.string "tipoHabitacion"
    t.boolean "estadoHabitacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tarifas_id"
    t.integer "tarifa_id"
    t.index ["tarifas_id"], name: "index_habitacions_on_tarifas_id"
  end

  create_table "reservas", force: :cascade do |t|
    t.datetime "fechaIngreso"
    t.datetime "fechaSalida"
    t.integer "cantidadPersonas"
    t.integer "cantidadHabitaciones"
    t.string "estadoReserva"
    t.integer "precioReserva"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "clientes_id"
    t.integer "cliente_id"
    t.integer "habitacion_id"
    t.bigint "habitacions_id"
    t.index ["clientes_id"], name: "index_reservas_on_clientes_id"
    t.index ["habitacions_id"], name: "index_reservas_on_habitacions_id"
  end

  create_table "tarifas", force: :cascade do |t|
    t.integer "preciotarifa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "habitacions", "tarifas", column: "tarifas_id"
  add_foreign_key "reservas", "clientes", column: "clientes_id"
  add_foreign_key "reservas", "habitacions", column: "habitacions_id"
end

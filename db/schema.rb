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

ActiveRecord::Schema[7.0].define(version: 2023_10_14_103030) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "servicios", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "descripcion"
  end

  create_table "servicios_solicitudes", id: false, force: :cascade do |t|
    t.bigint "servicio_id"
    t.bigint "solicitud_id"
    t.index ["servicio_id"], name: "index_servicios_solicitudes_on_servicio_id"
    t.index ["solicitud_id"], name: "index_servicios_solicitudes_on_solicitud_id"
  end

  create_table "servicios_solicituds", id: false, force: :cascade do |t|
    t.bigint "solicitud_id", null: false
    t.bigint "servicio_id", null: false
  end

  create_table "solicitudes", force: :cascade do |t|
    t.string "codigo"
    t.date "fecha_inicio"
    t.date "fecha_termino"
    t.string "estado"
    t.bigint "user_id", null: false
    t.bigint "vehiculo_id", null: false
    t.bigint "servicio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["servicio_id"], name: "index_solicitudes_on_servicio_id"
    t.index ["user_id"], name: "index_solicitudes_on_user_id"
    t.index ["vehiculo_id"], name: "index_solicitudes_on_vehiculo_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre"
    t.string "rut"
    t.string "telefono"
    t.string "direccion"
    t.string "role", default: "user"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehiculos", force: :cascade do |t|
    t.string "marca"
    t.string "modelo"
    t.integer "año"
    t.string "patente"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_vehiculos_on_user_id"
  end

  add_foreign_key "solicitudes", "servicios"
  add_foreign_key "solicitudes", "users"
  add_foreign_key "solicitudes", "vehiculos"
  add_foreign_key "vehiculos", "users"
end

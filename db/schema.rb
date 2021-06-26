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

ActiveRecord::Schema.define(version: 2021_06_26_182728) do

  create_table "encomendas", force: :cascade do |t|
    t.float "peso"
    t.string "remetente"
    t.integer "usuario_id", null: false
    t.integer "entrega_externa_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entrega_externa_id"], name: "index_encomendas_on_entrega_externa_id"
    t.index ["usuario_id"], name: "index_encomendas_on_usuario_id"
  end

  create_table "entrega_externas", force: :cascade do |t|
    t.date "dataChegada"
    t.time "horaChegada"
    t.string "recebidoPor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "entrega_internas", force: :cascade do |t|
    t.date "data_entrega"
    t.time "hora_recebida"
    t.string "recebido_por"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "entrega_externa_id", null: false
    t.index ["entrega_externa_id"], name: "index_entrega_internas_on_entrega_externa_id"
  end

  create_table "solicitacao_repasses", force: :cascade do |t|
    t.date "dataSolicitada"
    t.integer "entrega_externa_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entrega_externa_id"], name: "index_solicitacao_repasses_on_entrega_externa_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.string "cpf"
    t.integer "numero_residencia"
    t.integer "bloco_residencia"
    t.boolean "isMorador", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  add_foreign_key "encomendas", "entrega_externas"
  add_foreign_key "encomendas", "usuarios"
  add_foreign_key "entrega_internas", "entrega_externas"
  add_foreign_key "solicitacao_repasses", "entrega_externas"
end

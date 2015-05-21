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

ActiveRecord::Schema.define(version: 20150521155917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vk_categoriaprodutos", force: true do |t|
    t.string   "nome_categoria"
    t.string   "desc_categoria"
    t.integer  "father_id"
    t.integer  "integer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vk_cidades", force: true do |t|
    t.string   "nome_cidade"
    t.integer  "vk_estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vk_cidades", ["vk_estado_id"], name: "index_vk_cidades_on_vk_estado_id", using: :btree

  create_table "vk_empresas", force: true do |t|
    t.string   "nome_empresa"
    t.string   "cnpj_empresa"
    t.string   "nome_responsavel"
    t.string   "desc_telefone"
    t.string   "resu_atividade"
    t.integer  "vk_endereco_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vk_empresas", ["vk_endereco_id"], name: "index_vk_empresas_on_vk_endereco_id", using: :btree

  create_table "vk_enderecos", force: true do |t|
    t.string   "nome_bairro"
    t.string   "nome_rua"
    t.string   "desc_quadra"
    t.string   "desc_lote"
    t.string   "desc_complemento"
    t.string   "desc_cep"
    t.integer  "vk_cidade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vk_enderecos", ["vk_cidade_id"], name: "index_vk_enderecos_on_vk_cidade_id", using: :btree

  create_table "vk_estados", force: true do |t|
    t.string   "nome_estado"
    t.string   "sigl_estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vk_fotoprodutos", force: true do |t|
    t.integer  "vk_produto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "vk_fotoprodutos", ["vk_produto_id"], name: "index_vk_fotoprodutos_on_vk_produto_id", using: :btree

  create_table "vk_produtos", force: true do |t|
    t.string   "nome_produto"
    t.string   "desc_produto"
    t.decimal  "valr_produto"
    t.string   "desc_titulo"
    t.boolean  "flag_atacado"
    t.boolean  "flag_varejo"
    t.boolean  "flag_novo"
    t.boolean  "flag_anunciado"
    t.integer  "vk_categoriaproduto_id"
    t.integer  "vk_empresa_id"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vk_produtos", ["vk_categoriaproduto_id"], name: "index_vk_produtos_on_vk_categoriaproduto_id", using: :btree
  add_index "vk_produtos", ["vk_empresa_id"], name: "index_vk_produtos_on_vk_empresa_id", using: :btree

end

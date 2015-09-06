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

ActiveRecord::Schema.define(version: 20150906145427) do

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
    t.integer  "vk_empresa_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["vk_empresa_id"], name: "index_users_on_vk_empresa_id", using: :btree

  create_table "vk_anunciofavoritos", force: true do |t|
    t.integer  "vk_anuncio_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vk_anunciofavoritos", ["user_id"], name: "index_vk_anunciofavoritos_on_user_id", using: :btree
  add_index "vk_anunciofavoritos", ["vk_anuncio_id"], name: "index_vk_anunciofavoritos_on_vk_anuncio_id", using: :btree

  create_table "vk_anuncios", force: true do |t|
    t.string   "desc_titulo"
    t.string   "desc_anuncio"
    t.decimal  "valr_produto"
    t.decimal  "valr_comdesconto"
    t.datetime "data_inicio"
    t.datetime "data_fim"
    t.integer  "numr_qtddisponivel"
    t.boolean  "flag_ilimitado"
    t.integer  "numr_visualizacao"
    t.integer  "numr_click"
    t.datetime "data_bloqueio"
    t.integer  "vk_produto_id"
    t.integer  "vk_empresa_id"
    t.integer  "user_inclusao"
    t.integer  "integer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vk_anuncios", ["vk_empresa_id"], name: "index_vk_anuncios_on_vk_empresa_id", using: :btree
  add_index "vk_anuncios", ["vk_produto_id"], name: "index_vk_anuncios_on_vk_produto_id", using: :btree

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
    t.string   "nome_pagina"
  end

  add_index "vk_empresas", ["vk_endereco_id"], name: "index_vk_empresas_on_vk_endereco_id", using: :btree

  create_table "vk_empresavitrines", force: true do |t|
    t.integer  "vk_vitrine_id"
    t.integer  "vk_empresa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vk_empresavitrines", ["vk_empresa_id"], name: "index_vk_empresavitrines_on_vk_empresa_id", using: :btree
  add_index "vk_empresavitrines", ["vk_vitrine_id"], name: "index_vk_empresavitrines_on_vk_vitrine_id", using: :btree

  create_table "vk_enderecoempresas", force: true do |t|
    t.integer  "vk_empresa_id"
    t.integer  "vk_endereco_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vk_enderecoempresas", ["vk_empresa_id"], name: "index_vk_enderecoempresas_on_vk_empresa_id", using: :btree
  add_index "vk_enderecoempresas", ["vk_endereco_id"], name: "index_vk_enderecoempresas_on_vk_endereco_id", using: :btree

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

  create_table "vk_vitrines", force: true do |t|
    t.string   "nome_vitrine"
    t.string   "desc_vitrine"
    t.integer  "vk_cidade_id"
    t.integer  "father_id"
    t.integer  "integer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vk_vitrines", ["vk_cidade_id"], name: "index_vk_vitrines_on_vk_cidade_id", using: :btree

end

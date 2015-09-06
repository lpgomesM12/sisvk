class AddNomePaginaToVkEmpresa < ActiveRecord::Migration
  def change
    add_column :vk_empresas, :nome_pagina, :string
  end
end

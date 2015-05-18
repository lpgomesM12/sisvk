class CreateVkEmpresas < ActiveRecord::Migration
  def change
    create_table :vk_empresas do |t|
      t.string :nome_empresa
      t.string :cnpj_empresa
      t.string :nome_responsavel
      t.string :desc_telefone
      t.string :resu_atividade
      t.references :vk_endereco, index: true

      t.timestamps
    end
  end
end

class CreateVkEnderecos < ActiveRecord::Migration
  def change
    create_table :vk_enderecos do |t|
      t.string :nome_bairro
      t.string :nome_rua
      t.string :desc_quadra
      t.string :desc_lote
      t.string :desc_complemento
      t.string :desc_cep
      t.references :vk_cidade, index: true

      t.timestamps
    end
  end
end

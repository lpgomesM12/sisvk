class CreateVkProdutos < ActiveRecord::Migration
  def change
    create_table :vk_produtos do |t|
      t.string :nome_produto
      t.string :desc_produto
      t.decimal :valr_produto
      t.string :desc_titulo
      t.boolean :flag_atacado
      t.boolean :flag_varejo
      t.boolean :flag_novo
      t.boolean :flag_anunciado
      t.references :vk_categoriaproduto, index: true
      t.references :vk_empresa, index: true
      t.integer :user_inclusao, :integer, :references => :User, index: true
      
      t.timestamps
    end
  end
end

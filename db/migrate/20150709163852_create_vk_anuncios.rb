class CreateVkAnuncios < ActiveRecord::Migration
  def change
    create_table :vk_anuncios do |t|
      t.string :desc_titulo
      t.string :desc_anuncio
      t.decimal :valr_produto
      t.decimal :valr_comdesconto
      t.datetime :data_inicio
      t.datetime :data_fim
      t.integer :numr_qtddisponivel
      t.boolean :flag_ilimitado
      t.integer :numr_visualizacao
      t.integer :numr_click
      t.datetime :data_bloqueio
      t.references :vk_produtos, index: true
      t.references :vk_empresa, index: true
      t.integer :user_inclusao, :integer, :references => :User, index: true

      t.timestamps
    end
  end
end

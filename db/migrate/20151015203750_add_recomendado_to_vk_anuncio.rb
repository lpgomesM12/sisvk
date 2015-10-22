class AddRecomendadoToVkAnuncio < ActiveRecord::Migration
  def change
    add_column :vk_anuncios, :numr_recomendado, :integer
  end
end

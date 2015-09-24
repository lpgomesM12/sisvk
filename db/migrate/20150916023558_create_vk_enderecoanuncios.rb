class CreateVkEnderecoanuncios < ActiveRecord::Migration
  def change
    create_table :vk_enderecoanuncios do |t|
      t.references :vk_anuncio, index: true
      t.references :vk_endereco, index: true

      t.timestamps
    end
  end
end

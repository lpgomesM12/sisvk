class CreateVkAnunciofavoritos < ActiveRecord::Migration
  def change
    create_table :vk_anunciofavoritos do |t|
      t.references :vk_anuncio, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end

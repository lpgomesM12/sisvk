class CreateVkFotoprodutos < ActiveRecord::Migration
  def change
    create_table :vk_fotoprodutos do |t|
      t.references :vk_produto, index: true

      t.timestamps
    end
  end
end

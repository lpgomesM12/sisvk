class CreateVkCategoriaprodutos < ActiveRecord::Migration
  def change
    create_table :vk_categoriaprodutos do |t|
      t.string :nome_categoria
      t.string :desc_categoria
      t.integer :father_id, :integer, :references => :vk_categoriaprodutos 

      t.timestamps
    end
  end
end

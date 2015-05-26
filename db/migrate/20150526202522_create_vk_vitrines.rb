class CreateVkVitrines < ActiveRecord::Migration
  def change
    create_table :vk_vitrines do |t|
      t.string :nome_vitrine
      t.string :desc_vitrine
      t.references :vk_cidade, index: true
      t.integer :father_id, :integer, :references => :vk_vitrines
      
      t.timestamps
    end
  end
end

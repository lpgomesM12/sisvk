class CreateVkEmpresavitrines < ActiveRecord::Migration
  def change
    create_table :vk_empresavitrines do |t|
      t.references :vk_vitrine, index: true
      t.references :vk_empresa, index: true

      t.timestamps
    end
  end
end

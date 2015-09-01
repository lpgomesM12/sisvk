class CreateVkEnderecoempresas < ActiveRecord::Migration
  def change
    create_table :vk_enderecoempresas do |t|
      t.references :vk_empresa, index: true
      t.references :vk_endereco, index: true

      t.timestamps
    end
  end
end

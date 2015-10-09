class AddCampoToVkendereco < ActiveRecord::Migration
  def change
    add_column :vk_enderecos, :longitude, :string
    add_column :vk_enderecos, :latitude, :string
  end
end

class AddAttachmentLogoToVkEmpresas < ActiveRecord::Migration
  def self.up
    change_table :vk_empresas do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :vk_empresas, :logo
  end
end

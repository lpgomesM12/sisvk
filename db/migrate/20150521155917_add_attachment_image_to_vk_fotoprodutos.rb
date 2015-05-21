class AddAttachmentImageToVkFotoprodutos < ActiveRecord::Migration
  def self.up
    change_table :vk_fotoprodutos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :vk_fotoprodutos, :image
  end
end

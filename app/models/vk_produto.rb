class VkProduto < ActiveRecord::Base
  belongs_to :vk_categoriaproduto
  belongs_to :vk_empresa
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"

  has_many :vk_fotoproduto, :dependent => :destroy
  accepts_nested_attributes_for :vk_fotoproduto, allow_destroy: true
end

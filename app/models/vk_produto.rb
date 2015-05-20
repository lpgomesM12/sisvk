class VkProduto < ActiveRecord::Base
  belongs_to :vk_categoriaproduto
  belongs_to :vk_empresa
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"
end

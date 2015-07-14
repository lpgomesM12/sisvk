class VkAnuncio < ActiveRecord::Base
  belongs_to :vk_produto
  belongs_to :vk_empresa
  belongs_to :user
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"
end

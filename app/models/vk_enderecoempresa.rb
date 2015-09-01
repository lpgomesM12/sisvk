class VkEnderecoempresa < ActiveRecord::Base
  belongs_to :vk_empresa
  belongs_to :vk_endereco, :dependent => :destroy
end

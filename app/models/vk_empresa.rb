class VkEmpresa < ActiveRecord::Base
  belongs_to :vk_endereco

  accepts_nested_attributes_for :vk_endereco, allow_destroy: true
end

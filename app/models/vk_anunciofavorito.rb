class VkAnunciofavorito < ActiveRecord::Base
  belongs_to :vk_anuncio
  belongs_to :user
end

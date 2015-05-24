class SiteController < ApplicationController

  respond_to :html
 def index
 	@vk_produtos = VkProduto.all
    respond_with(@vk_produtos)
 end
end

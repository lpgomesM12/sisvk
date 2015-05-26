class SiteController < ApplicationController

 # respond_to :html
 def index
   @q = VkProduto.ransack(params[:q])
   @vk_produtos = @q.result
   #respond_with(@vk_produtos)
 end
end

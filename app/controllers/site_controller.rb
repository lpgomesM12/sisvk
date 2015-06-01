class SiteController < ApplicationController

 # respond_to :html
 def index

     @vk_produtos = VkProduto.find_by_nome_produto_or_all(params[:q])

	  #	@q = VkProduto.ransack(params[:q])
	  #	@vk_produtos = @q.result
 end

 def home
 	
 end
end

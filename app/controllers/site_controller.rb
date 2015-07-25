class SiteController < ApplicationController

include ActionView::Helpers::NumberHelper
 # respond_to :html
 def index
   if params[:q] && !params[:vk_vitrine_id]
   @vk_anuncios = VkAnuncio.find_by_nome_anuncio_or_all(params[:q])
   elsif params[:vk_vitrine_id] && !params[:q]
      @vk_anuncios = VkAnuncio.busca_por_vitrine(params[:vk_vitrine_id])
   elsif params[:vk_vitrine_id] && params[:q]
    @vk_anuncios = VkAnuncio.busca_nome_vitrine(params[:q],params[:vk_vitrine_id])
   end
 end

 def show_anuncio
  @vk_anuncio = VkAnuncio.find(params[:id])
 end

 def home

 end

 #if params[:q] && !params[:vk_vitrine_id]
 #@vk_produtos = VkProduto.find_by_nome_produto_or_all(params[:q])
 #elsif params[:vk_vitrine_id] && !params[:q]
 #   @vk_produtos = VkProduto.busca_por_vitrine(params[:vk_vitrine_id])
 #elsif params[:vk_vitrine_id] && params[:q]
 # @vk_produtos = VkProduto.busca_nome_vitrine(params[:q],params[:vk_vitrine_id])
 #end

end

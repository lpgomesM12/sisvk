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

   if params[:vk_vitrine_id]
     @vitrine  = params[:vk_vitrine_id]
   end

  if user_signed_in?
      @vk_anuncioFavorito = VkAnunciofavorito.where(user_id: current_user.id)

     @vk_anuncioFavorito.each do |favorito|
       @vk_anuncios.each do |anuncio|
         if favorito.vk_anuncio_id == anuncio.id
            anuncio.favorito = true
         end
       end
     end
  end

 end

 def show_anuncio
  @vk_anuncio = VkAnuncio.find(params[:id])
 end

 def home
   @vk_vitirnes = VkVitrine.all
 end

 def show_empresa
   @vk_anuncios = VkAnuncio.where(vk_empresa_id: params[:id])
 end

 #if params[:q] && !params[:vk_vitrine_id]
 #@vk_produtos = VkProduto.find_by_nome_produto_or_all(params[:q])
 #elsif params[:vk_vitrine_id] && !params[:q]
 #   @vk_produtos = VkProduto.busca_por_vitrine(params[:vk_vitrine_id])
 #elsif params[:vk_vitrine_id] && params[:q]
 # @vk_produtos = VkProduto.busca_nome_vitrine(params[:q],params[:vk_vitrine_id])
 #end

end

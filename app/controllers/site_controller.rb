class SiteController < ApplicationController

include ActionView::Helpers::NumberHelper
 # respond_to :html
 def index
   if params[:lat] != "" && params[:long] != ""
   @vk_anuncios = VkAnuncio.busca_lat_long(params[:lat],params[:long]).paginate(:page => params[:page], :per_page => 50)
 elsif params[:vk_vitrine_id] && params[:categoria] && params[:categoria] != ""
    @vk_anuncios = VkAnuncio.busca_categoria_vitrine(params[:categoria],params[:vk_vitrine_id]).paginate(:page => params[:page], :per_page => 50)
  elsif params[:vk_vitrine_id] && params[:vk_vitrine_id] != ""
    @vk_anuncios = busca_por_vitrine(params[:vk_vitrine_id]).paginate(:page => params[:page], :per_page => 50)
   # elsif params[:vk_vitrine_id] && params[:q]
   # @vk_anuncios = VkAnuncio.busca_nome_vitrine(params[:q],params[:vk_vitrine_id]).paginate(:page => params[:page], :per_page => 50)
   end

  @vk_categoriaProduto = VkCategoriaproduto.all

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

def busca_por_vitrine(vitrine)
       data = Time.now
       VkAnuncio.joins('INNER JOIN vk_empresas ve on ve.id = vk_empresa_id INNER JOIN vk_empresavitrines ev on ve.id = ev.vk_empresa_id ').where('ev.vk_vitrine_id = ? and data_inicio <= ? and data_fim  >= ?',vitrine,data,data).paginate(:page => params[:page], :per_page => 50)
end

 def show_anuncio
  @vk_anuncio = VkAnuncio.find(params[:id])
 end

 def home
   @vk_vitirnes = VkVitrine.all
 end

 def show_empresa
    @vk_anuncios = VkAnuncio.busca_por_empresa(params[:id])
 end

 #if params[:q] && !params[:vk_vitrine_id]
 #@vk_produtos = VkProduto.find_by_nome_produto_or_all(params[:q])
 #elsif params[:vk_vitrine_id] && !params[:q]
 #   @vk_produtos = VkProduto.busca_por_vitrine(params[:vk_vitrine_id])
 #elsif params[:vk_vitrine_id] && params[:q]
 # @vk_produtos = VkProduto.busca_nome_vitrine(params[:q],params[:vk_vitrine_id])
 #end

end

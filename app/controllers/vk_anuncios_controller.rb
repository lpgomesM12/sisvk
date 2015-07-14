class VkAnunciosController < ApplicationController
  before_action :set_vk_anuncio, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @vk_anuncios = VkAnuncio.all
    respond_with(@vk_anuncios)
  end

  def show
    respond_with(@vk_anuncio)
  end

  def new
    @vk_anuncio = VkAnuncio.new
    respond_with(@vk_anuncio)
  end

  def edit
  end

  def create
    @vk_anuncio = VkAnuncio.new(vk_anuncio_params)
    @vk_anuncio.save
    respond_with(@vk_anuncio)
  end

  def update
    @vk_anuncio.update(vk_anuncio_params)
    respond_with(@vk_anuncio)
  end

  def destroy
    @vk_anuncio.destroy
    respond_with(@vk_anuncio)
  end

  private
    def set_vk_anuncio
      @vk_anuncio = VkAnuncio.find(params[:id])
    end

    def vk_anuncio_params
      params.require(:vk_anuncio).permit(:desc_titulo, :desc_anuncio, :valr_produto, :valr_comdesconto, :data_inicio, :data_fim, :numr_qtddisponivel, :flag_ilimitado, :numr_visualizacao, :numr_click, :vk_produto_id, :vk_empresa_id, :user_id)
    end
end

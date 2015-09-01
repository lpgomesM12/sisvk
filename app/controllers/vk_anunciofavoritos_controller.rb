class VkAnunciofavoritosController < ApplicationController
  before_action :set_vk_anunciofavorito, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def salvar

    @anuncio = VkAnunciofavorito.where(vk_anuncio_id: params[:vk_anuncio_id], user_id: current_user.id)
    if @anuncio.empty?
      @vk_anunciofavorito = VkAnunciofavorito.new
      @vk_anunciofavorito.vk_anuncio_id = params[:vk_anuncio_id]
      @vk_anunciofavorito.user_id = current_user.id
      @vk_anunciofavorito.save
      vk_anuncio = VkAnuncio.find(params[:vk_anuncio_id])
      render :json => true
     else
        @vk_anunciofavorito = VkAnunciofavorito.find(@anuncio.first.id)
        @vk_anunciofavorito.destroy
       render :json => false
     end

  #   anuncioFavorito = VkAnunciofavorito.where(user_id: current_user.id)

  #  json = anuncioFavorito.map { |item| {:id => item.id,
  #                                       :desc_titulo => item.vk_anuncio.desc_titulo,
  #                                       :valr_produto => item.vk_anuncio.desc_anuncio,
  #                                       :desc_anuncio => item.vk_anuncio.desc_anuncio,
  #                                       :desc_anuncio => item.vk_anuncio.desc_anuncio,
  #                                       :desc_anuncio => item.vk_anuncio.desc_anuncio,
  #                                       :desc_anuncio => item.vk_anuncio.desc_anuncio,
  #                                       :desc_anuncio => item.vk_anuncio.desc_anuncio,
  #                                       }}


  end

  def index
    @vk_anunciofavoritos = VkAnunciofavorito.all
    respond_with(@vk_anunciofavoritos)
  end

  def show
    respond_with(@vk_anunciofavorito)
  end

  def new
    @vk_anunciofavorito = VkAnunciofavorito.new
    respond_with(@vk_anunciofavorito)
  end

  def edit
  end

  def create
    @vk_anunciofavorito = VkAnunciofavorito.new(vk_anunciofavorito_params)
    @vk_anunciofavorito.save
    respond_with(@vk_anunciofavorito)
  end

  def update
    @vk_anunciofavorito.update(vk_anunciofavorito_params)
    respond_with(@vk_anunciofavorito)
  end

  def destroy
    @vk_anunciofavorito.destroy
    respond_with(@vk_anunciofavorito)
  end

  private
    def set_vk_anunciofavorito
      @vk_anunciofavorito = VkAnunciofavorito.find(params[:id])
    end

    def vk_anunciofavorito_params
      params.require(:vk_anunciofavorito).permit(:vk_anuncio_id, :user_id)
    end
end

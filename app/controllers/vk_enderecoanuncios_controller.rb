class VkEnderecoanunciosController < ApplicationController
  before_action :set_vk_enderecoanuncio, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @vk_enderecoanuncios = VkEnderecoanuncio.all
    respond_with(@vk_enderecoanuncios)
  end

  def show
    respond_with(@vk_enderecoanuncio)
  end

  def new
    @vk_enderecoanuncio = VkEnderecoanuncio.new
    respond_with(@vk_enderecoanuncio)
  end

  def edit
  end

  def create
    @vk_enderecoanuncio = VkEnderecoanuncio.new(vk_enderecoanuncio_params)
    @vk_enderecoanuncio.save
    respond_with(@vk_enderecoanuncio)
  end

  def update
    @vk_enderecoanuncio.update(vk_enderecoanuncio_params)
    respond_with(@vk_enderecoanuncio)
  end

  def destroy
    @vk_enderecoanuncio.destroy
    respond_with(@vk_enderecoanuncio)
  end

  private
    def set_vk_enderecoanuncio
      @vk_enderecoanuncio = VkEnderecoanuncio.find(params[:id])
    end

    def vk_enderecoanuncio_params
      params.require(:vk_enderecoanuncio).permit(:vk_anuncio_id, :vk_endereco_id)
    end
end

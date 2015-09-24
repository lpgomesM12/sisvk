class VkEnderecosController < ApplicationController
  before_action :set_vk_endereco, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @vk_enderecos = VkEndereco.all
    respond_with(@vk_enderecos)
  end

  def show
    respond_with(@vk_endereco)
  end

  def new
    @vk_endereco = VkEndereco.new
    respond_with(@vk_endereco)
  end

  def edit
  end

  def create
    @vk_endereco = VkEndereco.new(vk_endereco_params)
    @vk_endereco.save
    respond_with(@vk_endereco)
  end

  def update
    @vk_endereco.update(vk_endereco_params)
    respond_with(@vk_endereco)
  end

  def destroy
    @vk_endereco.destroy
    respond_with(@vk_endereco)
  end

  private
    def set_vk_endereco
      @vk_endereco = VkEndereco.find(params[:id])
    end

    def vk_endereco_params
      params.require(:vk_endereco).permit(:nome_bairro, :nome_rua, :desc_quadra, :desc_lote, :desc_complemento, :desc_cep, :vk_cidade_id)
    end
end

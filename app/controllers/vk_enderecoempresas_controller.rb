class VkEnderecoempresasController < ApplicationController
  before_action :set_vk_enderecoempresa, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @vk_enderecoempresas = VkEnderecoempresa.all
    respond_with(@vk_enderecoempresas)
  end

  def show
    respond_with(@vk_enderecoempresa)
  end

  def new
    @vk_enderecoempresa = VkEnderecoempresa.new
    respond_with(@vk_enderecoempresa)
  end

  def edit
  end

  def create
    @vk_enderecoempresa = VkEnderecoempresa.new(vk_enderecoempresa_params)
    @vk_enderecoempresa.save
    respond_with(@vk_enderecoempresa)
  end

  def update
    @vk_enderecoempresa.update(vk_enderecoempresa_params)
    respond_with(@vk_enderecoempresa)
  end

  def destroy
    @vk_enderecoempresa.destroy
    respond_with(@vk_enderecoempresa)
  end

  private
    def set_vk_enderecoempresa
      @vk_enderecoempresa = VkEnderecoempresa.find(params[:id])
    end

    def vk_enderecoempresa_params
      params.require(:vk_enderecoempresa).permit(:vk_empresa_id, :vk_endereco_id)
    end
end

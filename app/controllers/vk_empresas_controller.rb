class VkEmpresasController < ApplicationController
  before_action :set_vk_empresa, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @vk_empresas = VkEmpresa.all
    respond_with(@vk_empresas)
  end

  def show
    respond_with(@vk_empresa)
  end

  def new
    @vk_empresa = VkEmpresa.new
    respond_with(@vk_empresa)
  end

  def edit
  end

  def create
    @vk_empresa = VkEmpresa.new(vk_empresa_params)
    @vk_empresa.save
    respond_with(@vk_empresa)
  end

  def update
    @vk_empresa.update(vk_empresa_params)
    respond_with(@vk_empresa)
  end

  def destroy
    @vk_empresa.destroy
    respond_with(@vk_empresa)
  end

  private
    def set_vk_empresa
      @vk_empresa = VkEmpresa.find(params[:id])
    end

    def vk_empresa_params
      params.require(:vk_empresa).permit(:nome_empresa, :cnpj_empresa, :nome_responsavel, :desc_telefone, :resu_atividade, :vk_endereco_id)
    end
end
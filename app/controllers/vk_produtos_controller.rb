class VkProdutosController < ApplicationController
  before_action :set_vk_produto, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @vk_produtos = VkProduto.all
    respond_with(@vk_produtos)
  end

  def show
    respond_with(@vk_produto)
  end

  def new
    @vk_produto = VkProduto.new
    respond_with(@vk_produto)
  end

  def edit
  end

  def create
    @vk_produto = VkProduto.new(vk_produto_params)
    @vk_produto.save

     redirect_to vk_produtos_path

  end

  def update
    @vk_produto.update(vk_produto_params)
    respond_with(@vk_produto)
  end

  def destroy
    @vk_produto.destroy
    respond_with(@vk_produto)
  end

  private
    def set_vk_produto
      @vk_produto = VkProduto.find(params[:id])
    end

    def vk_produto_params
      params.require(:vk_produto).permit(:nome_produto, :desc_produto, :valr_produto, :desc_titulo, :flag_atacado, :flag_varejo, :flag_novo, :flag_anunciado, :vk_categoriaproduto_id, :vk_empresa_id, :user_id)
    end
end
class VkCategoriaprodutosController < ApplicationController
  before_action :set_vk_categoriaproduto, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @vk_categoriaprodutos = VkCategoriaproduto.all
    respond_with(@vk_categoriaprodutos)
  end

  def show
    respond_with(@vk_categoriaproduto)
  end

  def new
    @vk_categoriaproduto = VkCategoriaproduto.new
    respond_with(@vk_categoriaproduto)
  end

  def edit
  end

  def create
    @vk_categoriaproduto = VkCategoriaproduto.new(vk_categoriaproduto_params)
    @vk_categoriaproduto.save
    respond_with(@vk_categoriaproduto)
  end

  def update
    @vk_categoriaproduto.update(vk_categoriaproduto_params)
    respond_with(@vk_categoriaproduto)
  end

  def destroy
    @vk_categoriaproduto.destroy
    respond_with(@vk_categoriaproduto)
  end

  private
    def set_vk_categoriaproduto
      @vk_categoriaproduto = VkCategoriaproduto.find(params[:id])
    end

    def vk_categoriaproduto_params
      params.require(:vk_categoriaproduto).permit(:nome_categoria, :desc_categoria)
    end
end

class VkProdutosController < ApplicationController
  before_action :set_vk_produto, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def busca_produtos
    vk_produto = VkProduto.where('lower(nome_produto) like ?', "%#{params[:nome_produto].downcase}%")
    vk_produto_json = vk_produto.map { |item| {:id => item.id, :nome_produto => item.nome_produto} }
    render :json => vk_produto_json
  end

  def index
    @vk_produtos = VkProduto.all
    respond_with(@vk_produtos)
  end

  def show
    respond_with(@vk_produto)
  end

  def new
    @vk_produto = VkProduto.new
    2.times{@vk_produto.vk_fotoproduto.build}
    respond_with(@vk_produto)
  end

  def edit
    2.times{@vk_produto.vk_fotoproduto.build}
  end

  def create
    @vk_produto = VkProduto.new(vk_produto_params)
    @vk_produto.save
    #redirect_to vk_anuncios/new
    redirect_to :controller => 'vk_anuncios', :action => 'new'
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
      params.require(:vk_produto).permit(:nome_produto, :desc_produto, :valr_produto, :desc_titulo, :flag_atacado, :flag_varejo, :flag_novo, :flag_anunciado, :vk_categoriaproduto_id, :vk_empresa_id, vk_fotoproduto_attributes: [:image])
    end
end

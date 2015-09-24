class VkAnunciosController < ApplicationController
  before_action :set_vk_anuncio, only: [:show, :edit, :update, :destroy]

  #before_action :authenticate_user!

  respond_to :html

def busca_endereco_anuncio
  retorna_endereco_anuncio(params[:vk_anuncio_id])
end

def retorna_endereco_anuncio(vk_anuncio)
   enderecoAnuncio = VkEnderecoanuncio.where(vk_anuncio_id: vk_anuncio)
   enderecoAnuncio_json = enderecoAnuncio.map { |item| {:id => item.id,
                                                       :nome_rua => item.vk_endereco.nome_rua,
                                                       :desc_quadra => item.vk_endereco.desc_quadra,
                                                       :desc_lote => item.vk_endereco.desc_lote,
                                                       :nome_bairro => item.vk_endereco.nome_bairro,
                                                       :desc_complemento => item.vk_endereco.desc_complemento,
                                                       :desc_cep => item.vk_endereco.desc_cep,
                                                       :nome_cidade => item.vk_endereco.vk_cidade.nome_cidade,
                                                       :sigl_estado => item.vk_endereco.vk_cidade.vk_estado.sigl_estado}}
 render :json => enderecoAnuncio_json
 end

def busca_endereco_empresa

  enderecoEmpresa = VkEnderecoempresa.where(vk_empresa_id: params[:vk_empresa_id])
  enderecoEmpresa_json = enderecoEmpresa.map { |item| {:id => item.id,
                                                       :vk_endereco_id => item.vk_endereco_id,
                                                       :nome_rua => item.vk_endereco.nome_rua,
                                                       :desc_quadra => item.vk_endereco.desc_quadra,
                                                       :desc_lote => item.vk_endereco.desc_lote,
                                                       :nome_bairro => item.vk_endereco.nome_bairro,
                                                       :desc_complemento => item.vk_endereco.desc_complemento,
                                                       :desc_cep => item.vk_endereco.desc_cep,
                                                       :nome_cidade => item.vk_endereco.vk_cidade.nome_cidade,
                                                       :sigl_estado => item.vk_endereco.vk_cidade.vk_estado.sigl_estado}}
  render :json => enderecoEmpresa_json
end

def salva_endereco_anuncio
 @vk_enderecoanuncio = VkEnderecoanuncio.new
 @vk_enderecoanuncio.vk_anuncio_id = params[:vk_anuncio_id]
 @vk_enderecoanuncio.vk_endereco_id = params[:vk_endereco_id]

 @vk_enderecoanuncio.save

 retorna_endereco_anuncio(params[:vk_anuncio_id])

end

def exclui_endereco_anuncio
 @vk_enderecoanuncio = VkEnderecoanuncio.find(params[:id])
 @vk_enderecoanuncio.destroy

 retorna_endereco_anuncio(params[:vk_anuncio_id])
end

 def produtos
   @vk_produtos = VkProduto.find_by_nome_produto_or_all(params[:q]).paginate(:page => params[:page], :per_page => 10)

   #@vk_produtos = VkProduto.exists?('nome_produto LIKE ?',"%#{params[:q]}%"])

   #Person.exists?(['name LIKE ?', "%#{query}%"])

   respond_with(@vk_produtos)
 end

  def index
    @vk_anuncios = VkAnuncio.all
    respond_with(@vk_anuncios)
  end

  def show
    @vk_enderecoAnuncio = VkEnderecoanuncio.where(vk_anuncio_id: params[:id])
    respond_with(@vk_anuncio)
  end

  def new
    @vk_anuncio = VkAnuncio.new
    @vk_produto = VkProduto.find(params[:produto_id])
    @vk_anuncio.vk_produto_id = @vk_produto.id
    @nome_produto = @vk_produto.nome_produto

    respond_with(@vk_anuncio)
  end

  def edit

  end

  def endereco
    @vk_enderecoAnuncio = VkEnderecoanuncio.where(vk_anuncio_id: params[:id])
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

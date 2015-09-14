#encoding: utf-8
class VkEmpresasController < ApplicationController
  before_action :set_vk_empresa, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html, :json


 def salva_endereco

  @vk_endereco = VkEndereco.new
  @vk_endereco.nome_bairro = params[:nome_bairro]
  @vk_endereco.nome_rua = params[:nome_rua]
  @vk_endereco.desc_quadra = params[:quadra]
  @vk_endereco.desc_lote = params[:lote]
  @vk_endereco.desc_complemento = params[:complemento]
  @vk_endereco.desc_cep = params[:cep]
  @vk_endereco.vk_cidade_id = params[:cidade]
  @vk_endereco.save

  @vk_enderecoEmpresa = VkEnderecoempresa.new
  @vk_enderecoEmpresa.vk_empresa_id = params[:empresa]
  @vk_enderecoEmpresa.vk_endereco_id = @vk_endereco.id
  @vk_enderecoEmpresa.save

   enderecoEmpresa = VkEnderecoempresa.where(vk_empresa_id: params[:empresa])
  enderecoEmpresa_json = enderecoEmpresa.map { |item| {:id => item.id,
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


 def exclui_endereco
     @vk_enderecoEmpresa = VkEnderecoempresa.find(params[:id_endereco])
     @vk_enderecoEmpresa.destroy

     enderecoEmpresa = VkEnderecoempresa.where(vk_empresa_id: params[:empresa])
     enderecoEmpresa_json = enderecoEmpresa.map { |item| {:id => item.id,
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

  def index
    @vk_empresas = VkEmpresa.all
    respond_with(@vk_empresas)
  end

  def show
    respond_with(@vk_empresa)
  end

  def new
    @vk_empresa = VkEmpresa.new
    @vk_empresa.build_vk_endereco
    @vk_enderecoEmpresa  = VkEnderecoempresa.new

    respond_with(@vk_empresa)
  end

  def edit
     @vk_empresa.build_vk_endereco
     @vk_enderecoEmpresa = VkEnderecoempresa.where(vk_empresa_id: @vk_empresa.id)
  end

  def create
    @vk_empresa = VkEmpresa.new(vk_empresa_params)
         if @vk_empresa.save
            atualiza_usuario(@vk_empresa.id)
            flash[:notice] = 'Cadastro realizado com sucesso'
               @vk_enderecoEmpresa = VkEnderecoempresa.where(vk_empresa_id: @vk_empresa.id)
              redirect_to edit_vk_empresa_path(@vk_empresa)
            else
         respond_with(@vk_empresa)
      end
  end

def atualiza_usuario(empresa_id)
   @user = User.find(current_user.id)
   @user.vk_empresa_id = empresa_id
   @user.save
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
      params.require(:vk_empresa).permit(:nome_pagina, :nome_empresa, :cnpj_empresa, :nome_responsavel, :desc_telefone, :resu_atividade, vk_endereco_attributes: [ :id, :nome_bairro , :nome_rua, :desc_quadra, :desc_lote, :desc_complemento, :desc_cep, :vk_cidade_id])
    end
end

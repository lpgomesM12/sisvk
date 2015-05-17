class VkCidadesController < ApplicationController
  before_action :set_vk_cidade, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!

  # GET /vk_cidades
  def index
    @vk_cidades = VkCidade.all
  end

  # GET /vk_cidades/1
  def show
  end

  # GET /vk_cidades/new
  def new
    @vk_cidade = VkCidade.new
  end

  # GET /vk_cidades/1/edit
  def edit
  end

  # POST /vk_cidades
  def create
    @vk_cidade = VkCidade.new(vk_cidade_params)

    if @vk_cidade.save
      redirect_to @vk_cidade, notice: 'Vk cidade was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /vk_cidades/1
  def update
    if @vk_cidade.update(vk_cidade_params)
      redirect_to @vk_cidade, notice: 'Vk cidade was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /vk_cidades/1
  def destroy
    @vk_cidade.destroy
    redirect_to vk_cidades_url, notice: 'Vk cidade was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vk_cidade
      @vk_cidade = VkCidade.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vk_cidade_params
      params.require(:vk_cidade).permit(:nome_cidade, :vk_estado_id)
    end
end

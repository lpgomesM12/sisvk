class VkEmpresavitrinesController < ApplicationController
  before_action :set_vk_empresavitrine, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @vk_empresavitrines = VkEmpresavitrine.all
    respond_with(@vk_empresavitrines)
  end

  def show
    respond_with(@vk_empresavitrine)
  end

  def new
    @vk_empresavitrine = VkEmpresavitrine.new
    respond_with(@vk_empresavitrine)
  end

  def edit
  end

  def create
    @vk_empresavitrine = VkEmpresavitrine.new(vk_empresavitrine_params)
    @vk_empresavitrine.save
    respond_with(@vk_empresavitrine)
  end

  def update
    @vk_empresavitrine.update(vk_empresavitrine_params)
    respond_with(@vk_empresavitrine)
  end

  def destroy
    @vk_empresavitrine.destroy
    respond_with(@vk_empresavitrine)
  end

  private
    def set_vk_empresavitrine
      @vk_empresavitrine = VkEmpresavitrine.find(params[:id])
    end

    def vk_empresavitrine_params
      params.require(:vk_empresavitrine).permit(:vk_vitrine_id, :vk_empresa_id)
    end
end

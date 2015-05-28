class VkVitrinesController < ApplicationController
  before_action :set_vk_vitrine, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @vk_vitrines = VkVitrine.all
    respond_with(@vk_vitrines)
  end

  def show
    respond_with(@vk_vitrine)
  end

  def new
    @vk_vitrine = VkVitrine.new
    respond_with(@vk_vitrine)
  end

  def edit
    @vk_vitrinePai = @vk_vitrine.father_id
  end

  def create
    @vk_vitrine = VkVitrine.new(vk_vitrine_params)
    @vk_vitrine.save
    respond_with(@vk_vitrine)
  end

  def update
    @vk_vitrine.update(vk_vitrine_params)
    respond_with(@vk_vitrine)
  end

  def destroy
    @vk_vitrine.destroy
    respond_with(@vk_vitrine)
  end

  private
    def set_vk_vitrine
      @vk_vitrine = VkVitrine.find(params[:id])
    end

    def vk_vitrine_params
      params.require(:vk_vitrine).permit(:nome_vitrine, :desc_vitrine, :vk_cidade_id)
    end
end

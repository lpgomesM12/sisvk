class VkVitrinesController < ApplicationController
  before_action :set_vk_vitrine, only: [:show, :edit, :update, :destroy]

  respond_to :html


  def buscaVitrines

  if params[:father_id].blank?
    vk_vitrine = VkVitrine.all()
  else
    vk_vitrine = VkVitrine.where('father_id = ' + params[:father_id].to_s)
  end

   vk_vitrine_json = vk_vitrine.map{|item|{:id => item.id, :nome_vitrine => item.nome_vitrine}}
   render :json => vk_vitrine_json

  end


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
      params.require(:vk_vitrine).permit(:father_id, :nome_vitrine, :desc_vitrine, :vk_cidade_id)
    end
end

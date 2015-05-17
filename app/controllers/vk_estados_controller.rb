class VkEstadosController < ApplicationController
  before_action :set_vk_estado, only: [:show, :edit, :update, :destroy]

  # GET /vk_estados
  def index
    @vk_estados = VkEstado.all
  end

  # GET /vk_estados/1
  def show
  end

  # GET /vk_estados/new
  def new
    @vk_estado = VkEstado.new
  end

  # GET /vk_estados/1/edit
  def edit
  end

  # POST /vk_estados
  def create
    @vk_estado = VkEstado.new(vk_estado_params)

    if @vk_estado.save
      redirect_to @vk_estado, notice: 'Vk estado was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /vk_estados/1
  def update
    if @vk_estado.update(vk_estado_params)
      redirect_to @vk_estado, notice: 'Vk estado was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /vk_estados/1
  def destroy
    @vk_estado.destroy
    redirect_to vk_estados_url, notice: 'Vk estado was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vk_estado
      @vk_estado = VkEstado.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vk_estado_params
      params.require(:vk_estado).permit(:nome_estado, :sigl_estado)
    end
end

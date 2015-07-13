require 'test_helper'

class VkAnunciosControllerTest < ActionController::TestCase
  setup do
    @vk_anuncio = vk_anuncios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vk_anuncios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vk_anuncio" do
    assert_difference('VkAnuncio.count') do
      post :create, vk_anuncio: { data_fim: @vk_anuncio.data_fim, data_inicio: @vk_anuncio.data_inicio, desc_anuncio: @vk_anuncio.desc_anuncio, desc_titulo: @vk_anuncio.desc_titulo, flag_ilimitado: @vk_anuncio.flag_ilimitado, numr_click: @vk_anuncio.numr_click, numr_qtddisponivel: @vk_anuncio.numr_qtddisponivel, numr_visualizacao: @vk_anuncio.numr_visualizacao, user_id: @vk_anuncio.user_id, valr_comdesconto: @vk_anuncio.valr_comdesconto, valr_produto: @vk_anuncio.valr_produto, vk_empresa_id: @vk_anuncio.vk_empresa_id, vk_produtos_id: @vk_anuncio.vk_produtos_id }
    end

    assert_redirected_to vk_anuncio_path(assigns(:vk_anuncio))
  end

  test "should show vk_anuncio" do
    get :show, id: @vk_anuncio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vk_anuncio
    assert_response :success
  end

  test "should update vk_anuncio" do
    patch :update, id: @vk_anuncio, vk_anuncio: { data_fim: @vk_anuncio.data_fim, data_inicio: @vk_anuncio.data_inicio, desc_anuncio: @vk_anuncio.desc_anuncio, desc_titulo: @vk_anuncio.desc_titulo, flag_ilimitado: @vk_anuncio.flag_ilimitado, numr_click: @vk_anuncio.numr_click, numr_qtddisponivel: @vk_anuncio.numr_qtddisponivel, numr_visualizacao: @vk_anuncio.numr_visualizacao, user_id: @vk_anuncio.user_id, valr_comdesconto: @vk_anuncio.valr_comdesconto, valr_produto: @vk_anuncio.valr_produto, vk_empresa_id: @vk_anuncio.vk_empresa_id, vk_produtos_id: @vk_anuncio.vk_produtos_id }
    assert_redirected_to vk_anuncio_path(assigns(:vk_anuncio))
  end

  test "should destroy vk_anuncio" do
    assert_difference('VkAnuncio.count', -1) do
      delete :destroy, id: @vk_anuncio
    end

    assert_redirected_to vk_anuncios_path
  end
end

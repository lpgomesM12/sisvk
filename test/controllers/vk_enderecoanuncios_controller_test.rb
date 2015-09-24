require 'test_helper'

class VkEnderecoanunciosControllerTest < ActionController::TestCase
  setup do
    @vk_enderecoanuncio = vk_enderecoanuncios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vk_enderecoanuncios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vk_enderecoanuncio" do
    assert_difference('VkEnderecoanuncio.count') do
      post :create, vk_enderecoanuncio: { vk_anuncio_id: @vk_enderecoanuncio.vk_anuncio_id, vk_endereco_id: @vk_enderecoanuncio.vk_endereco_id }
    end

    assert_redirected_to vk_enderecoanuncio_path(assigns(:vk_enderecoanuncio))
  end

  test "should show vk_enderecoanuncio" do
    get :show, id: @vk_enderecoanuncio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vk_enderecoanuncio
    assert_response :success
  end

  test "should update vk_enderecoanuncio" do
    patch :update, id: @vk_enderecoanuncio, vk_enderecoanuncio: { vk_anuncio_id: @vk_enderecoanuncio.vk_anuncio_id, vk_endereco_id: @vk_enderecoanuncio.vk_endereco_id }
    assert_redirected_to vk_enderecoanuncio_path(assigns(:vk_enderecoanuncio))
  end

  test "should destroy vk_enderecoanuncio" do
    assert_difference('VkEnderecoanuncio.count', -1) do
      delete :destroy, id: @vk_enderecoanuncio
    end

    assert_redirected_to vk_enderecoanuncios_path
  end
end

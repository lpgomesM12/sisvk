require 'test_helper'

class VkAnunciofavoritosControllerTest < ActionController::TestCase
  setup do
    @vk_anunciofavorito = vk_anunciofavoritos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vk_anunciofavoritos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vk_anunciofavorito" do
    assert_difference('VkAnunciofavorito.count') do
      post :create, vk_anunciofavorito: { user_id: @vk_anunciofavorito.user_id, vk_anuncio_id: @vk_anunciofavorito.vk_anuncio_id }
    end

    assert_redirected_to vk_anunciofavorito_path(assigns(:vk_anunciofavorito))
  end

  test "should show vk_anunciofavorito" do
    get :show, id: @vk_anunciofavorito
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vk_anunciofavorito
    assert_response :success
  end

  test "should update vk_anunciofavorito" do
    patch :update, id: @vk_anunciofavorito, vk_anunciofavorito: { user_id: @vk_anunciofavorito.user_id, vk_anuncio_id: @vk_anunciofavorito.vk_anuncio_id }
    assert_redirected_to vk_anunciofavorito_path(assigns(:vk_anunciofavorito))
  end

  test "should destroy vk_anunciofavorito" do
    assert_difference('VkAnunciofavorito.count', -1) do
      delete :destroy, id: @vk_anunciofavorito
    end

    assert_redirected_to vk_anunciofavoritos_path
  end
end

require 'test_helper'

class VkEstadosControllerTest < ActionController::TestCase
  setup do
    @vk_estado = vk_estados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vk_estados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vk_estado" do
    assert_difference('VkEstado.count') do
      post :create, vk_estado: { nome_estado: @vk_estado.nome_estado, sigl_estado: @vk_estado.sigl_estado }
    end

    assert_redirected_to vk_estado_path(assigns(:vk_estado))
  end

  test "should show vk_estado" do
    get :show, id: @vk_estado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vk_estado
    assert_response :success
  end

  test "should update vk_estado" do
    patch :update, id: @vk_estado, vk_estado: { nome_estado: @vk_estado.nome_estado, sigl_estado: @vk_estado.sigl_estado }
    assert_redirected_to vk_estado_path(assigns(:vk_estado))
  end

  test "should destroy vk_estado" do
    assert_difference('VkEstado.count', -1) do
      delete :destroy, id: @vk_estado
    end

    assert_redirected_to vk_estados_path
  end
end

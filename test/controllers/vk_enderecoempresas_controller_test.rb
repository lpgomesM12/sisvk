require 'test_helper'

class VkEnderecoempresasControllerTest < ActionController::TestCase
  setup do
    @vk_enderecoempresa = vk_enderecoempresas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vk_enderecoempresas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vk_enderecoempresa" do
    assert_difference('VkEnderecoempresa.count') do
      post :create, vk_enderecoempresa: { vk_empresa_id: @vk_enderecoempresa.vk_empresa_id, vk_endereco_id: @vk_enderecoempresa.vk_endereco_id }
    end

    assert_redirected_to vk_enderecoempresa_path(assigns(:vk_enderecoempresa))
  end

  test "should show vk_enderecoempresa" do
    get :show, id: @vk_enderecoempresa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vk_enderecoempresa
    assert_response :success
  end

  test "should update vk_enderecoempresa" do
    patch :update, id: @vk_enderecoempresa, vk_enderecoempresa: { vk_empresa_id: @vk_enderecoempresa.vk_empresa_id, vk_endereco_id: @vk_enderecoempresa.vk_endereco_id }
    assert_redirected_to vk_enderecoempresa_path(assigns(:vk_enderecoempresa))
  end

  test "should destroy vk_enderecoempresa" do
    assert_difference('VkEnderecoempresa.count', -1) do
      delete :destroy, id: @vk_enderecoempresa
    end

    assert_redirected_to vk_enderecoempresas_path
  end
end

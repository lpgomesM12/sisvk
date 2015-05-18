require 'test_helper'

class VkEnderecosControllerTest < ActionController::TestCase
  setup do
    @vk_endereco = vk_enderecos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vk_enderecos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vk_endereco" do
    assert_difference('VkEndereco.count') do
      post :create, vk_endereco: { desc_cep: @vk_endereco.desc_cep, desc_complemento: @vk_endereco.desc_complemento, desc_lote: @vk_endereco.desc_lote, desc_quadra: @vk_endereco.desc_quadra, nome_bairro: @vk_endereco.nome_bairro, nome_rua: @vk_endereco.nome_rua, vk_cidade_id: @vk_endereco.vk_cidade_id }
    end

    assert_redirected_to vk_endereco_path(assigns(:vk_endereco))
  end

  test "should show vk_endereco" do
    get :show, id: @vk_endereco
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vk_endereco
    assert_response :success
  end

  test "should update vk_endereco" do
    patch :update, id: @vk_endereco, vk_endereco: { desc_cep: @vk_endereco.desc_cep, desc_complemento: @vk_endereco.desc_complemento, desc_lote: @vk_endereco.desc_lote, desc_quadra: @vk_endereco.desc_quadra, nome_bairro: @vk_endereco.nome_bairro, nome_rua: @vk_endereco.nome_rua, vk_cidade_id: @vk_endereco.vk_cidade_id }
    assert_redirected_to vk_endereco_path(assigns(:vk_endereco))
  end

  test "should destroy vk_endereco" do
    assert_difference('VkEndereco.count', -1) do
      delete :destroy, id: @vk_endereco
    end

    assert_redirected_to vk_enderecos_path
  end
end

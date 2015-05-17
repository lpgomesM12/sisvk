require 'test_helper'

class VkCidadesControllerTest < ActionController::TestCase
  setup do
    @vk_cidade = vk_cidades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vk_cidades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vk_cidade" do
    assert_difference('VkCidade.count') do
      post :create, vk_cidade: { nome_cidade: @vk_cidade.nome_cidade, vk_estado_id: @vk_cidade.vk_estado_id }
    end

    assert_redirected_to vk_cidade_path(assigns(:vk_cidade))
  end

  test "should show vk_cidade" do
    get :show, id: @vk_cidade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vk_cidade
    assert_response :success
  end

  test "should update vk_cidade" do
    patch :update, id: @vk_cidade, vk_cidade: { nome_cidade: @vk_cidade.nome_cidade, vk_estado_id: @vk_cidade.vk_estado_id }
    assert_redirected_to vk_cidade_path(assigns(:vk_cidade))
  end

  test "should destroy vk_cidade" do
    assert_difference('VkCidade.count', -1) do
      delete :destroy, id: @vk_cidade
    end

    assert_redirected_to vk_cidades_path
  end
end

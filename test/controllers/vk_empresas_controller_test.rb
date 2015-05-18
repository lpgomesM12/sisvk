require 'test_helper'

class VkEmpresasControllerTest < ActionController::TestCase
  setup do
    @vk_empresa = vk_empresas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vk_empresas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vk_empresa" do
    assert_difference('VkEmpresa.count') do
      post :create, vk_empresa: { cnpj_empresa: @vk_empresa.cnpj_empresa, desc_telefone: @vk_empresa.desc_telefone, nome_empresa: @vk_empresa.nome_empresa, nome_responsavel: @vk_empresa.nome_responsavel, resu_atividade: @vk_empresa.resu_atividade, vk_endereco_id: @vk_empresa.vk_endereco_id }
    end

    assert_redirected_to vk_empresa_path(assigns(:vk_empresa))
  end

  test "should show vk_empresa" do
    get :show, id: @vk_empresa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vk_empresa
    assert_response :success
  end

  test "should update vk_empresa" do
    patch :update, id: @vk_empresa, vk_empresa: { cnpj_empresa: @vk_empresa.cnpj_empresa, desc_telefone: @vk_empresa.desc_telefone, nome_empresa: @vk_empresa.nome_empresa, nome_responsavel: @vk_empresa.nome_responsavel, resu_atividade: @vk_empresa.resu_atividade, vk_endereco_id: @vk_empresa.vk_endereco_id }
    assert_redirected_to vk_empresa_path(assigns(:vk_empresa))
  end

  test "should destroy vk_empresa" do
    assert_difference('VkEmpresa.count', -1) do
      delete :destroy, id: @vk_empresa
    end

    assert_redirected_to vk_empresas_path
  end
end

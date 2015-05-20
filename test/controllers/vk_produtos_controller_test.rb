require 'test_helper'

class VkProdutosControllerTest < ActionController::TestCase
  setup do
    @vk_produto = vk_produtos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vk_produtos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vk_produto" do
    assert_difference('VkProduto.count') do
      post :create, vk_produto: { desc_produto: @vk_produto.desc_produto, desc_titulo: @vk_produto.desc_titulo, flag_anunciado: @vk_produto.flag_anunciado, flag_atacado: @vk_produto.flag_atacado, flag_novo: @vk_produto.flag_novo, flag_varejo: @vk_produto.flag_varejo, nome_produto: @vk_produto.nome_produto, user_id: @vk_produto.user_id, valr_produto: @vk_produto.valr_produto, vk_categoriaproduto_id: @vk_produto.vk_categoriaproduto_id, vk_empresa_id: @vk_produto.vk_empresa_id }
    end

    assert_redirected_to vk_produto_path(assigns(:vk_produto))
  end

  test "should show vk_produto" do
    get :show, id: @vk_produto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vk_produto
    assert_response :success
  end

  test "should update vk_produto" do
    patch :update, id: @vk_produto, vk_produto: { desc_produto: @vk_produto.desc_produto, desc_titulo: @vk_produto.desc_titulo, flag_anunciado: @vk_produto.flag_anunciado, flag_atacado: @vk_produto.flag_atacado, flag_novo: @vk_produto.flag_novo, flag_varejo: @vk_produto.flag_varejo, nome_produto: @vk_produto.nome_produto, user_id: @vk_produto.user_id, valr_produto: @vk_produto.valr_produto, vk_categoriaproduto_id: @vk_produto.vk_categoriaproduto_id, vk_empresa_id: @vk_produto.vk_empresa_id }
    assert_redirected_to vk_produto_path(assigns(:vk_produto))
  end

  test "should destroy vk_produto" do
    assert_difference('VkProduto.count', -1) do
      delete :destroy, id: @vk_produto
    end

    assert_redirected_to vk_produtos_path
  end
end

require 'test_helper'

class VkCategoriaprodutosControllerTest < ActionController::TestCase
  setup do
    @vk_categoriaproduto = vk_categoriaprodutos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vk_categoriaprodutos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vk_categoriaproduto" do
    assert_difference('VkCategoriaproduto.count') do
      post :create, vk_categoriaproduto: { desc_categoria: @vk_categoriaproduto.desc_categoria, nome_categoria: @vk_categoriaproduto.nome_categoria }
    end

    assert_redirected_to vk_categoriaproduto_path(assigns(:vk_categoriaproduto))
  end

  test "should show vk_categoriaproduto" do
    get :show, id: @vk_categoriaproduto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vk_categoriaproduto
    assert_response :success
  end

  test "should update vk_categoriaproduto" do
    patch :update, id: @vk_categoriaproduto, vk_categoriaproduto: { desc_categoria: @vk_categoriaproduto.desc_categoria, nome_categoria: @vk_categoriaproduto.nome_categoria }
    assert_redirected_to vk_categoriaproduto_path(assigns(:vk_categoriaproduto))
  end

  test "should destroy vk_categoriaproduto" do
    assert_difference('VkCategoriaproduto.count', -1) do
      delete :destroy, id: @vk_categoriaproduto
    end

    assert_redirected_to vk_categoriaprodutos_path
  end
end

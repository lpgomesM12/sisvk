require 'test_helper'

class VkEmpresavitrinesControllerTest < ActionController::TestCase
  setup do
    @vk_empresavitrine = vk_empresavitrines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vk_empresavitrines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vk_empresavitrine" do
    assert_difference('VkEmpresavitrine.count') do
      post :create, vk_empresavitrine: { vk_empresa_id: @vk_empresavitrine.vk_empresa_id, vk_vitrine_id: @vk_empresavitrine.vk_vitrine_id }
    end

    assert_redirected_to vk_empresavitrine_path(assigns(:vk_empresavitrine))
  end

  test "should show vk_empresavitrine" do
    get :show, id: @vk_empresavitrine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vk_empresavitrine
    assert_response :success
  end

  test "should update vk_empresavitrine" do
    patch :update, id: @vk_empresavitrine, vk_empresavitrine: { vk_empresa_id: @vk_empresavitrine.vk_empresa_id, vk_vitrine_id: @vk_empresavitrine.vk_vitrine_id }
    assert_redirected_to vk_empresavitrine_path(assigns(:vk_empresavitrine))
  end

  test "should destroy vk_empresavitrine" do
    assert_difference('VkEmpresavitrine.count', -1) do
      delete :destroy, id: @vk_empresavitrine
    end

    assert_redirected_to vk_empresavitrines_path
  end
end

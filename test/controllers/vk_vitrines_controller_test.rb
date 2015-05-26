require 'test_helper'

class VkVitrinesControllerTest < ActionController::TestCase
  setup do
    @vk_vitrine = vk_vitrines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vk_vitrines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vk_vitrine" do
    assert_difference('VkVitrine.count') do
      post :create, vk_vitrine: { desc_vitrine: @vk_vitrine.desc_vitrine, nome_vitrine: @vk_vitrine.nome_vitrine, vk_cidade_id: @vk_vitrine.vk_cidade_id }
    end

    assert_redirected_to vk_vitrine_path(assigns(:vk_vitrine))
  end

  test "should show vk_vitrine" do
    get :show, id: @vk_vitrine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vk_vitrine
    assert_response :success
  end

  test "should update vk_vitrine" do
    patch :update, id: @vk_vitrine, vk_vitrine: { desc_vitrine: @vk_vitrine.desc_vitrine, nome_vitrine: @vk_vitrine.nome_vitrine, vk_cidade_id: @vk_vitrine.vk_cidade_id }
    assert_redirected_to vk_vitrine_path(assigns(:vk_vitrine))
  end

  test "should destroy vk_vitrine" do
    assert_difference('VkVitrine.count', -1) do
      delete :destroy, id: @vk_vitrine
    end

    assert_redirected_to vk_vitrines_path
  end
end

require 'test_helper'

class StockstatusesControllerTest < ActionController::TestCase
  setup do
    @stockstatus = stockstatuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stockstatuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stockstatus" do
    assert_difference('Stockstatus.count') do
      post :create, stockstatus: { stuff: @stockstatus.stuff }
    end

    assert_redirected_to stockstatus_path(assigns(:stockstatus))
  end

  test "should show stockstatus" do
    get :show, id: @stockstatus
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stockstatus
    assert_response :success
  end

  test "should update stockstatus" do
    patch :update, id: @stockstatus, stockstatus: { stuff: @stockstatus.stuff }
    assert_redirected_to stockstatus_path(assigns(:stockstatus))
  end

  test "should destroy stockstatus" do
    assert_difference('Stockstatus.count', -1) do
      delete :destroy, id: @stockstatus
    end

    assert_redirected_to stockstatuses_path
  end
end

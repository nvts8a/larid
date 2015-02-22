require 'test_helper'

class FishermenControllerTest < ActionController::TestCase
  setup do
    @fisherman = fishermen(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fishermen)
  end

  test "should create fisherman" do
    assert_difference('Fisherman.count') do
      post :create, fisherman: { email: @fisherman.email, name: @fisherman.name }
    end

    assert_response 201
  end

  test "should show fisherman" do
    get :show, id: @fisherman
    assert_response :success
  end

  test "should update fisherman" do
    put :update, id: @fisherman, fisherman: { email: @fisherman.email, name: @fisherman.name }
    assert_response 204
  end

  test "should destroy fisherman" do
    assert_difference('Fisherman.count', -1) do
      delete :destroy, id: @fisherman
    end

    assert_response 204
  end
end

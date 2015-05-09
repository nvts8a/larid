require "test_helper"

class V1::UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:joe)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post :create, user: {
        email: "test_email@larid.com",
        first_name: "First", 
        last_name: "Last",
        password: "password"
      }
    end

    assert_response 201
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: {
      email: @user.email,
      first_name: @user.first_name 
    }
    assert_response 204
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete :destroy, id: @user
    end

    assert_response 204
  end
end

require "test_helper"

class V1::UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:joe)
  end

  test "#create" do
    post "create", {
      user: {
        first_name: "Billy",
        last_name: "Blowers",
        email: "billy_blowers@example.com",
        password: "secret",
      }
    }
    results = JSON.parse(response.body)
    assert results["access_token"] =~ /\S{32}/
    assert results["user_id"] > 0
  end

  test "#create with invalid data" do
    post "create", {
      user: {
        email: "",
        password: "",
      }
    }
    results = JSON.parse(response.body)
    assert results["errors"].size == 2
  end

  test "#show" do
    post "show", { id: @user }
    results = JSON.parse(response.body)
    assert results["id"] == @user.id
    assert results["first_name"] == @user.first_name
  end

  test "#index without token in header" do
    get "index"
    assert response.status == 401
  end

  test "#index with invalid token" do
    get "index", {}, { "Authorization" => "Bearer 12345" }
    assert response.status == 401
  end

  test "#index with expired token" do
    expired_api_key = @user.api_keys.session.create
    expired_api_key.update_attribute(:expired_at, 30.days.ago)
    assert !ApiKey.active.map(&:id).include?(expired_api_key.id)
    get "index", {}, { "Authorization" => "Bearer #{expired_api_key.access_token}" }
    assert response.status == 401
  end

  test "#index with valid token" do
    api_key = @user.session_api_key
    get "index", {}, { "Authorization" => "Bearer #{api_key.access_token}" }
    results = JSON.parse(response.body)
    assert results.size == 2
  end

  test "#update" do
    put :update, id: @user, user: {
      email: @user.email,
      first_name: @user.first_name 
    }
    assert_response 204
  end

  test "#destroy" do
    assert_difference("User.count", -1) do
      delete :destroy, id: @user
    end

    assert_response 204
  end
end

require 'test_helper'

class V1::SessionControllerTest < ActionController::TestCase
  setup do
    @user = users(:jane)
  end

  test "authenticate with email" do
    pw = @user.password
    post 'create', { email: @user.email, password: pw }
    results = JSON.parse(response.body)
    assert results['access_token'] =~ /\S{32}/
    assert results['user_id'] == @user.id
  end

  test "authenticate with invalid info" do
    pw = @user.password
    post 'create', { email: @user.email, password: 'huh' }
    assert response.status == 401
  end
end

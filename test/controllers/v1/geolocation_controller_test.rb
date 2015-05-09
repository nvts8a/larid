require 'test_helper'

class V1::GeolocationControllerTest < ActionController::TestCase
  setup do
    ForecastService.stubs(:current_weather).returns(true)
    GbifService.stubs(:current_biodiversity).returns(true)
  end

  test "should get weather" do
    get :index, latitude: 1, longitude: 1

    assert_response :success
    assert JSON.parse(response.body)["weather"] 
  end

  test "should get biodiversity" do
    test_geolocation = get :index, latitude: 1, longitude: 1

    assert_response :success
    assert JSON.parse(response.body)["biodiversity"] 
  end
end

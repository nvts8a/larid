class V1::GeolocationController < ApplicationController
  def index
    geolocation_figures = {
      weather: ForecastService.current_weather(geolocation_params),
      biodiversity: GbifService.current_biodiversity(geolocation_params)
    }

    render json: geolocation_figures
  end

  private

  def geolocation_params
    params.permit(:latitude, :longitude)
  end
end

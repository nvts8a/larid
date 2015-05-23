class V1::GeolocationController < ApplicationController
  def index
    geolocation_figures = {
      weather: serialized_weather,
      biodiversity: serialized_biodiversity
    }

    render json: geolocation_figures
  end

  private

  def geolocation_params
    params.permit(:latitude, :longitude)
  end

  def serialized_weather
    weather = ForecastService.current_weather(geolocation_params)
    { currently: weather["currently"] }
  end

  def serialized_biodiversity
    biodiversity = GbifService.current_biodiversity(geolocation_params)
    results = biodiversity["results"].map do |result|
      {
        decimalLatitude: result["decimalLatitude"],
        decimalLongitude: result["decimalLongitude"],
        eventDate: result["eventDate"],
        occurrenceRemarks: result["occurrenceRemarks"],
        species: result["species"],
        verbatimLocality: result["verbatimLocality"]
      }
    end

    results.select! { |result| result[:species] }
    results.uniq! { |result| [ result[:species], result[:decimalLatitude], result[:decimalLongitude] ] }
  end
end

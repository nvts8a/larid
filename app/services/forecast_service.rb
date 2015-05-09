class ForecastService
  class << self
    def current_weather(geolocation)
      url = "#{Settings.forecast.host}/#{Settings.forecast.api_key}/#{geolocation[:latitude]},#{geolocation[:longitude]}"
      JSON.parse(RestClient.get url)
    end
  end
end

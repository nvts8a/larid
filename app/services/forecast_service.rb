class ForecastService
  class << self
    def current_weather(latitude, longitude)
      url = "#{Settings.forecast.host}/#{Settings.forecast.api_key}/#{latitude},#{longitude}"
      JSON.parse(RestClient.get url)
    end
  end
end

class GbifService
  class << self
    def current_biodiversity(latitude, longitude)
      latMin = latitude - 0.15
      latMax = latitude + 0.15
      lngMin = longitude - 0.15
      lngMax = longitude + 0.15

      url = "#{Settings.gbif.host}/v1/occurrence/search?taxonKey=#{Settings.gbif.taxonomy_key}&decimalLatitude=#{latMin},#{latMax}&decimalLongitude=#{lngMin},#{lngMax}"
    
      JSON.parse(RestClient.get url) 
    end
  end
end

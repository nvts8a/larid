class GbifService
  class << self
    def current_biodiversity(geolocation)
      latMin = geolocation[:latitude].to_f - 0.15
      latMax = geolocation[:latitude].to_f + 0.15
      lngMin = geolocation[:longitude].to_f - 0.15
      lngMax = geolocation[:longitude].to_f + 0.15

      url = "#{Settings.gbif.host}/v1/occurrence/search?taxonKey=#{Settings.gbif.taxonomy_key}&decimalLatitude=#{latMin},#{latMax}&decimalLongitude=#{lngMin},#{lngMax}"
    
      JSON.parse(RestClient.get url) 
    end
  end
end

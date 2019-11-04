class GeocodeService
  include ApiFetchable

  def initialize(location)
    @location = location
  end

  def get_location
    retrieve_data(request_path)
  end

  def request_path
    "https://maps.googleapis.com/maps/api/geocode/json" \
      "?address=#{@location}&key=#{ENV['google_api_key']}"
  end
end

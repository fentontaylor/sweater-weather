class GeocodeService
  include ApiFetchable

  def initialize(city)
    @city = city
  end

  def lat_long
    response = api_fetch(geocode_path)
    data = parse_json(response)
    location = extract_lat_long(data)
    location.values.join(',')
  end

  private

  def geocode_path
    "https://maps.googleapis.com/maps/api/geocode/json" \
      "?address=#{@city}&key=#{ENV['google_api_key']}"
  end

  def extract_lat_long(data)
    data[:results].first[:geometry][:location]
  end
end

class GeocodeService
  def initialize(city)
    @city = city
  end

  def lat_long
    data = parse_json(fetch_location)
    location = extract_lat_long(data)
    location.values.join(',')
  end

  private

  def geocode_path
    "https://maps.googleapis.com/maps/api/geocode/json" \
      "?address=#{@city}&key=#{ENV['google_api_key']}"
  end

  def fetch_location
    Faraday.get(geocode_path)
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def extract_lat_long(data)
    data[:results].first[:geometry][:location]
  end
end

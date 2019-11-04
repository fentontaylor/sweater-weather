class AntipodeService
  include ApiFetchable

  def initialize(location)
    @lat = location[:lat]
    @long = location[:lng]
  end

  def get_antipode
    resp = conn.get
    parse_json(resp)
  end

  def conn
    Faraday.new(
      url: "http://amypode.herokuapp.com/api/v1/antipodes",
      params: { lat: @lat, long: @long },
      headers: { api_key: ENV['amypode_api_key']}
    )
  end
end

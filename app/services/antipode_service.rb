class AntipodeService
  include ApiFetchable

  def initialize(location)
    @location = location
  end

  def get_antipode

  end

  def conn(coords)
    Faraday.new(
      url: "http://amypode.herokuapp.com/api/v1/antipodes",
      params: coords,
      headers: { api_key: ENV['amypode_api_key']}
    )
  end
end

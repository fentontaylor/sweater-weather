class ForecastPresenter
  def initialize(location)
    @location = location
  end

  def city
    geolocation.city
  end

  def state
    geolocation.state
  end

  def country
    geolocation.country
  end

  def latitude
    geolocation.latitude
  end

  def longitude
    geolocation.longitude
  end

  private

  def geolocation
    @geolocation ||= Geolocation.new(geocode_service.get_location_data)
  end

  def geocode_service
    @geocode_service ||= GeocodeService.new(@location)
  end
end

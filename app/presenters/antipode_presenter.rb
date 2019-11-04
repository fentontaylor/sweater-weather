class AntipodePresenter
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def antipode_city
    antipode_location.city
  end

  def weather_summary
    forecast.summary_current
  end

  def temp_current
    forecast.temp_current
  end

  private

  def geocode_service
    @geocode_service ||= GeocodeService.new(@location)
  end

  def search_location
    @search_location ||= Geolocation.new(geocode_service.get_location)
  end

  def antipode_service
    @antip_service = AntipodeService.new(geolocation.lat_long)
  end

  def antipode_location
    @antipode_location ||= Antipode.new(antipode_service.get_antipode)
  end

  def forecast_service
    @forecast_service ||= ForecastService.new(geolocation.lat_long_string)
  end

  def forecast
    @forecast ||= Forecast.new(forecast_service.get_forecast)
  end
end

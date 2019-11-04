class AntipodePresenter
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def antipode_city
    antipode_location.formatted_address
  end

  def weather_summary
    forecast.summary_current
  end

  def temp_current
    forecast.temp_current
  end

  private

  def geo_service(location)
    GeocodeService.new(location)
  end

  def search_location
    @search_location ||= Geolocation.new(geo_service(@location).get_location)
  end

  def antipode_service
    @antip_service = AntipodeService.new(search_location.lat_long)
  end

  def antipode
    @antipode ||= Antipode.new(antipode_service.get_antipode)
  end

  def antipode_location
    @antipode_location ||= Geolocation.new(geo_service(antipode.lat_long_string).get_location)
  end

  def forecast_service
    @forecast_service ||= ForecastService.new(antipode.lat_long_string)
  end

  def forecast
    @forecast ||= Forecast.new(forecast_service.get_forecast)
  end
end

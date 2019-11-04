class AntipodePresenter
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def antipode_city

  end

  def weather_summary

  end

  def temp_current

  end

  private

  def geocode_service
    @geocode_service ||= GeocodeService.new(@location)
  end

  def geolocation
    @geolocation ||= Geolocation.new(geo_service.get_location)
  end

  def antipode_service
    @antip_service = AntipodeService.new(geolocation.lat_long)
  end

  # def forecast_service
  #   @forecast_service ||= ForecastService.new(geolocation.lat_long_string)
  # end
  #
  # def forecast
  #   @forecast ||= Forecast.new(forecast_service.get_forecast)
  # end
end

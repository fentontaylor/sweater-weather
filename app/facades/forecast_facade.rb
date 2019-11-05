class ForecastFacade
  attr_reader :id, :type

  def initialize(location)
    @location = location
    @id = nil
    @type = 'forecast'
  end

  def location_info
    geolocation_decorator.location_info
  end

  def summary
    forecast_decorator.summary
  end

  def current_forecast
    forecast_decorator.current_forecast
  end

  def hourly_forecast
    forecast_decorator.hourly_forecast
  end

  def daily_forecast
    forecast_decorator.daily_forecast
  end

  private

  def geocode_service
    @geocode_service ||= GeocodeService.new(@location)
  end

  def forecast_service
    @forecast_service ||= ForecastService.new(geolocation.lat_long_string)
  end

  def geolocation
    @geolocation ||= Geolocation.new(geocode_service.get_location)
  end

  def geolocation_decorator
    @geolocation_decorator ||= GeolocationDecorator.new(geolocation)
  end

  def forecast
    @forecast ||= Forecast.new(forecast_service.get_forecast)
  end

  def forecast_decorator
    @forecast_decorator ||= ForecastDecorator.new(forecast)
  end
end

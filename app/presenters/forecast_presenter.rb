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

  def time
    forecast_decorator.time
  end

  def date
    forecast_decorator.date
  end

  def summary_current
    forecast_decorator.summary_current
  end

  def summary_today
    forecast_decorator.summary_today
  end

  def summary_tonight
    forecast_decorator.summary_tonight
  end

  def icon
    forecast_decorator.icon
  end

  def temp_current
    forecast_decorator.temp_current
  end

  def feels_like
    forecast_decorator.feels_like
  end

  def humidity
    forecast_decorator.humidity
  end

  def visibility
    forecast_decorator.visibility
  end

  def uv_index
    forecast_decorator.uv_index
  end

  def temp_high
    forecast_decorator.temp_high
  end

  def temp_low
    forecast_decorator.temp_low
  end

  def hourly_forecast
    forecast_decorator.hourly_forecast
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

  def forecast
    @forecast ||= Forecast.new(forecast_service.get_forecast)
  end

  def forecast_decorator
    @forecast_decorator ||= ForecastDecorator.new(forecast)
  end
end

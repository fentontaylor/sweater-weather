class RoadTripFacade
  attr_reader :id, :type, :origin, :destination

  def initialize(args)
    @origin = args[:origin]
    @destination = args[:destination]
    @id = nil
    @type = 'road_trip'
  end

  def temperature
    forecast.temp_current
  end

  def summary
    forecast.summary_current
  end

  def approx_travel_time
    road_trip.approx_travel_time
  end

  private

  def road_trip_service
    @road_trip_service ||= RoadTripService.new(@origin, @destination)
  end

  def road_trip
    @road_trip ||= RoadTrip.new(road_trip_service.get_directions)
  end

  def forecast_service
    @forecast_service ||= ForecastService.new(
      road_trip.lat_long_string,
      road_trip.travel_seconds
    )
  end

  def forecast
    @forecast ||= Forecast.new(forecast_service.get_forecast)
  end
end

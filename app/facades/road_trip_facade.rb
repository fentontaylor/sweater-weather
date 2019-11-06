class RoadTripFacade
  attr_reader :id, :type, :origin, :destination

  def initialize(args)
    @origin = args[:origin]
    @destination = args[:destination]
    @id = nil
    @type = 'road_trip'
  end

  def temperature

  end

  def summary

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
end

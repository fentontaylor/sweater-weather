class RoadTrip
  attr_reader :origin, :destination, :approx_travel_time, :travel_seconds

  def initialize(hash)
    @origin = hash[:routes].first[:legs].first[:start_address]
    @destination = hash[:routes].first[:legs].first[:end_address]
    @approx_travel_time = hash[:routes].first[:legs].first[:duration][:text]
    @travel_seconds = hash[:routes].first[:legs].first[:duration][:value]
  end
end

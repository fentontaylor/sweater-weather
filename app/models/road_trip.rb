class RoadTrip
  attr_reader :origin, :destination, :approx_travel_time, :travel_seconds

  def initialize(hash)
    @origin = hash[:routes].first[:legs].first[:start_address]
    @destination = hash[:routes].first[:legs].first[:end_address]
    @approx_travel_time = hash[:routes].first[:legs].first[:duration][:text]
    @travel_seconds = hash[:routes].first[:legs].first[:duration][:value]
    @destination_coords = hash[:routes].first[:legs].first[:end_location]
  end

  def lat_long_string
    @destination_coords.values.join(',')
  end
end

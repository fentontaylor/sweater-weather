class RoadTripService
  include ApiFetchable

  def initialize(args)
    @origin = args[:origin]
    @destination = args[:destination]
  end

  def get_directions
    retrieve_data(request_path)
  end

  def request_path
    "https://maps.googleapis.com/maps/api/directions/json?destination=#{@destination}&key=#{ENV['google_api_key']}&origin=#{@origin}"
  end
end

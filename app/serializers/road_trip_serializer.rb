class RoadTripSerializer
  include FastJsonapi::ObjectSerializer

  attribute :temperature do |obj|
    obj.temperature
  end

  attribute :summary do |obj|
    obj.summary
  end

  attribute :approx_travel_time do |obj|
    obj.approx_travel_time
  end
end

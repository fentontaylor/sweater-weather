class RoadTripSerializer
  include FastJsonapi::ObjectSerializer

  attributes :origin, :destination

  attribute :approx_travel_time do |obj|
    obj.approx_travel_time
  end

  attribute :temperature do |obj|
    obj.temperature
  end

  attribute :summary do |obj|
    obj.summary
  end
end

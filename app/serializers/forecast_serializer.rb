class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  attribute :location do |obj|
    obj.location_info
  end

  attribute :summary do |obj|
    obj.summary
  end

  attribute :current do |obj|
    obj.current_forecast
  end

  attribute :hourly do |obj|
    obj.hourly_forecast
  end

  attribute :daily do |obj|
    obj.daily_forecast
  end
end

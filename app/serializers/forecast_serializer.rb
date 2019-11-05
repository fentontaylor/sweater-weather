class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  attribute :summary do |obj|
    obj.summary
  end

  attribute :hourly do |obj|
    obj.hourly_forecast
  end

  attribute :daily do |obj|
    obj.daily_forecast
  end
end

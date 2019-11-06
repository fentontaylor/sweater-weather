require 'rails_helper'

describe ForecastDaily do
  it 'can initialize with keyword arguments' do
    stub_denver_forecast

    service = ForecastService.new('39.7392358,-104.990251')
    forecast = Forecast.new(service.get_forecast)
    decorator = ForecastDecorator.new(forecast)
    day = decorator.daily[:data].first
    forecast = ForecastDaily.new(decorator, day)
    
    expect(forecast).to be_an_instance_of(ForecastDaily)
  end
end

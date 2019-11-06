require 'rails_helper'

describe ForecastHourly do
  it 'can initialize with decorator object and hour hash' do
    stub_denver_forecast

    service = ForecastService.new('39.7392358,-104.990251')
    forecast = Forecast.new(service.get_forecast)
    decorator = ForecastDecorator.new(forecast)
    hour = decorator.hourly[:data].first

    forecast = ForecastHourly.new(decorator, hour)
    expect(forecast).to be_an_instance_of(ForecastHourly)
  end
end

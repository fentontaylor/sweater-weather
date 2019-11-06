require 'mock_helper'

describe ForecastSummary do
  it 'can initialize with a forecast decorator object' do
    stub_denver_forecast

    service = ForecastService.new('39.7392358,-104.990251')
    forecast = Forecast.new(service.get_forecast)
    decorator = ForecastDecorator.new(forecast)
    summary = ForecastSummary.new(decorator)

    expect(summary).to be_an_instance_of(ForecastSummary)
  end
end

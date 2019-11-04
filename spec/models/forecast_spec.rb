require 'mock_helper'

describe Forecast do
  before :each do
    stub_denver_location
    stub_denver_forecast

    service = ForecastService.new('39.7392358,-104.990251')
    data = service.get_forecast
    @forecast = Forecast.new(data)
  end

  it 'can initialize with a hash' do
    expect(@forecast).to be_an_instance_of(Forecast)
  end

  it 'attributes' do
    expect(@forecast.temp_current).to eq(44.26)
    expect(@forecast.temp_high).to eq(51.75)
    expect(@forecast.temp_low).to eq(27.56)
    expect(@forecast.feels_like).to eq(40.75)
    expect(@forecast.humidity).to eq(0.42)
    expect(@forecast.visibility).to eq(10)
    expect(@forecast.uv_index).to eq(1)
    expect(@forecast.icon).to eq('partly-cloudy-day')
    expect(@forecast.summary_current).to eq('Partly Cloudy')
    expect(@forecast.summary_today).to eq('Partly cloudy throughout the day.')
    expect(@forecast.current_time).to eq(1572733611)
    expect(@forecast.hourly).to be_a Hash
    expect(@forecast.daily).to be_a Hash
  end
end

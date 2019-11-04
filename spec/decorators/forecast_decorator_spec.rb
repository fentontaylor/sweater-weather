require 'mock_helper'

describe ForecastDecorator do
  before :each do
    stub_denver_location
    stub_denver_forecast

    service = ForecastService.new('39.7392358,-104.990251')
    data = service.get_forecast
    @forecast = Forecast.new(data)
    @decorator = ForecastDecorator.new(@forecast)
  end

  it 'can initialize with a Forecast object' do
    expect(@decorator).to be_an_instance_of(ForecastDecorator)
  end

  it 'can call all the attributes of forecast' do
    expect(@decorator.temp_current).to eq(44.26)
    expect(@decorator.temp_high).to eq(51.75)
    expect(@decorator.temp_low).to eq(27.56)
    expect(@decorator.feels_like).to eq(40.75)
    expect(@decorator.humidity).to eq(0.42)
    expect(@decorator.visibility).to eq(10)
    expect(@decorator.uv_index).to eq(1)
    expect(@decorator.icon).to eq('partly-cloudy-day')
    expect(@decorator.summary_current).to eq('Partly Cloudy')
    expect(@decorator.summary_today).to eq('Partly cloudy throughout the day.')
    expect(@decorator.current_time).to eq(1572733611)
  end

  describe 'decorator methods' do
    it '#summary_tonight' do
      expect(@decorator.summary_tonight).to eq('Clear')
      expect(@decorator.time).to eq('4:26 PM')
      expect(@decorator.date).to eq('11/02')
    end
  end
end

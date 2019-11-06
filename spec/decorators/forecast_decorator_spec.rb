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
    it '#summary' do
      expect(@decorator.summary).to be_a ForecastSummary
    end

    it '#current_forecast' do
      expect(@decorator.current_forecast).to be_a ForecastCurrent
    end

    it '#hourly_forecast' do
      hourly = @decorator.hourly_forecast
      expect(hourly).to be_an Array
      expect(hourly.count).to eq(8)

      all_forecast_hourly = hourly.all? { |obj| obj.class == ForecastHourly }

      expect(all_forecast_hourly). to be true
    end

    it '#hourly_forecast' do
      daily = @decorator.daily_forecast
      expect(daily).to be_an Array
      expect(daily.count).to eq(5)

      all_forecast_daily = daily.all? { |obj| obj.class == ForecastDaily }

      expect(all_forecast_daily). to be true
    end
  end
end

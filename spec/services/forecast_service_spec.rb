require 'mock_helper'

describe 'ForecastService' do
  it 'takes a city and returns DarkSky forecast' do
    stub_denver_location
    stub_denver_forecast

    service = ForecastService.new('denver,co')

    data = service.get_forecast

    expect(data).to have_key(:latitude)
    expect(data).to have_key(:longitude)
    expect(data).to have_key(:timezone)
    expect(data).to have_key(:currently)
    expect(data).to have_key(:hourly)
    expect(data).to have_key(:offset)
  end
end

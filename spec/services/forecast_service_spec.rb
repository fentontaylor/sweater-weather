require 'mock_helper'

describe ForecastService do
  it "takes a city's lat/lng and returns DarkSky forecast" do
    stub_denver_location
    stub_denver_forecast

    data = GeocodeService.new('denver,co').get_location
    geolocation = Geolocation.new(data)
    service = ForecastService.new(geolocation.lat_long_string)

    data = service.get_forecast

    expect(data).to have_key(:latitude)
    expect(data).to have_key(:longitude)
    expect(data).to have_key(:timezone)
    expect(data).to have_key(:currently)
    expect(data).to have_key(:hourly)
    expect(data).to have_key(:offset)
  end
end

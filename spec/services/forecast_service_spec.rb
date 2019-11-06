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

  it 'can initialize with added travel time to change the request_path' do
    time = Time.at(1573000000)
    allow(Time).to receive(:now).and_return(time)

    travel_time = 5678
    future_time = Time.now.to_i + travel_time

    service = ForecastService.new('38, -104', travel_time)

    expect(service.request_path).to include(future_time.to_s)
  end
end

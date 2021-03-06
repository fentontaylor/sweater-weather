require 'rails_helper'

def stub_denver_location
  service = GeocodeService.new('denver,co')
  json = File.open('./spec/fixtures/geocode_denver.json')
  stub_request(:get, service.request_path)
    .to_return(status: 200, body: json)
end

def stub_denver_forecast
  service = ForecastService.new('39.7392358,-104.990251')
  json = File.open('./spec/fixtures/forecast_denver.json')
  stub_request(:get, service.request_path)
    .to_return(status: 200, body: json)
end

def stub_denver_images
  json = File.open('./spec/fixtures/images_denver.json')
  stub_request(:get, 'https://api.unsplash.com/search/photos')
    .with(
      headers: { 'Authorization' => "Client-ID #{ENV['unsplash_key']}" },
      query: {
        query: 'denver skyline',
        orientation: 'landscape',
        per_page: 50
      }
    ).to_return(status: 200, body: json)
end

def stub_denver_to_pueblo_directions
  service = RoadTripService.new('Denver,CO', 'Pueblo,CO')
  json = File.open('./spec/fixtures/directions_denver_to_pueblo.json')
  stub_request(:get, service.request_path)
    .to_return(status: 200, body: json)
end

def stub_pueblo_future_forecast
  json = File.read('./spec/fixtures/forecast_future_pueblo.json')
  data = JSON.parse(json, symbolize_names: true)
  allow_any_instance_of(ForecastService)
    .to receive(:get_forecast)
    .and_return(data)
end

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

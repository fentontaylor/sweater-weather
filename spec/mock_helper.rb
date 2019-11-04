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

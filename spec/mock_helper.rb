require 'rails_helper'

def stub_location(location, file)
  service = GeocodeService.new(location)
  json = File.open(file)
  stub_request(:get, service.request_path)
    .to_return(status: 200, body: json)
end

def stub_forecast(location, file)
  service = ForecastService.new(location)
  json = File.open(file)
  stub_request(:get, service.request_path)
    .to_return(status: 200, body: json)
end

def stub_denver_location
  stub_location('denver,co', './spec/fixtures/geocode_denver.json')
end

def stub_hong_kong_location
  stub_location('Hong Kong', './spec/fixtures/geocode_hong_kong.json')
end

def stub_jujuy_location
  stub_location('-22.3193039,-65.8306389', './spec/fixtures/geocode_jujuy.json')
end

def stub_denver_forecast
  stub_forecast('39.7392358,-104.990251', './spec/fixtures/forecast_denver.json')
end

def stub_jujuy_forecast
  stub_forecast('-22.3193039,-65.8306389', './spec/fixtures/forecast_jujuy.json')
end

def stub_amypode_hong_kong
  json = File.open('./spec/fixtures/amypode_hong_kong.json')
  stub_request(:get, 'http://amypode.herokuapp.com/api/v1/antipodes?lat=22.3193039&long=114.1693611')
    .with(headers: { 'api_key' => ENV['amypode_api_key']})
    .to_return(status: 200, body: json)
end

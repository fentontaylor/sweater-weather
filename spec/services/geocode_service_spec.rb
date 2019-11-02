require 'rails_helper'

describe 'GeocodeService' do
  it 'takes a city and returns the latitude/longitude' do
    service = GeocodeService.new('Denver')
    expect(service.lat_long).to eq('39.7392358,-104.990251')
  end
end

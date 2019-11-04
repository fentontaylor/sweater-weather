require 'mock_helper'

describe Geolocation, type: :model do
  before :each do
    stub_denver_location

    service = GeocodeService.new('denver,co')
    data = service.get_location
    @geolocation = Geolocation.new(data)
  end

  it 'can initialize with a hash' do
    expect(@geolocation).to be_an_instance_of(Geolocation)
  end

  it 'attributes' do
    address = JSON.parse(
      '[
          {
             "long_name": "Denver",
             "short_name": "Denver",
             "types": [
                "locality",
                "political"
             ]
          },
          {
             "long_name": "Denver County",
             "short_name": "Denver County",
             "types": [
                "administrative_area_level_2",
                "political"
             ]
          },
          {
             "long_name": "Colorado",
             "short_name": "CO",
             "types": [
                "administrative_area_level_1",
                "political"
             ]
          },
          {
             "long_name": "United States",
             "short_name": "US",
             "types": [
                "country",
                "political"
             ]
          }
        ]', symbolize_names: true)

    lat_long = { lat: 39.7392358, lng: -104.990251 }

    expect(@geolocation.address_components).to eq(address)
    expect(@geolocation.formatted_address).to eq('Denver, CO, USA')
    expect(@geolocation.lat_long).to eq(lat_long)
  end

  describe 'instance methods' do
    it '#city' do
      expect(@geolocation.city).to eq('Denver')
    end

    it '#state' do
      expect(@geolocation.state).to eq('CO')
    end

    it '#country' do
      expect(@geolocation.country).to eq('United States')
    end

    it '#latitude' do
      expect(@geolocation.latitude).to eq(39.7392358)
    end

    it '#longitude' do
      expect(@geolocation.longitude).to eq(-104.990251)
    end

    it '#lat_long_string' do
      expect(@geolocation.lat_long_string).to eq('39.7392358,-104.990251')
    end
  end
end

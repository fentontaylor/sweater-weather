require 'mock_helper'

describe LocationInfo do
  before :each do
    stub_denver_location

    service = GeocodeService.new('denver,co')
    data = service.get_location
    @geolocation = Geolocation.new(data)
  end

  it 'can initialize with a geolocation object' do
    location_info =
      LocationInfo.new(
        city: 'city',
        state: 'state',
        country: 'country',
        latitude: 'latitude',
        longitude: 'longitude'
      )
    expect(location_info).to be_an_instance_of(LocationInfo)
  end
end

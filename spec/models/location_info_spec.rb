require 'mock_helper'

describe LocationInfo do
  it 'can initialize with GeolocationDecorator object' do
    stub_denver_location
    service = GeocodeService.new('denver,co')
    location = Geolocation.new(service.get_location)
    decorator = GeolocationDecorator.new(location)
    
    location_info = LocationInfo.new(decorator)
    expect(location_info).to be_an_instance_of(LocationInfo)
  end
end

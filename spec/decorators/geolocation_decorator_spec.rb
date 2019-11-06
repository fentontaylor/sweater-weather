require 'mock_helper'

describe GeolocationDecorator do
  before :each do
    stub_denver_location

    service = GeocodeService.new('denver,co')
    data = service.get_location
    @geolocation = Geolocation.new(data)
    @decorator = GeolocationDecorator.new(@geolocation)
  end

  it 'can initialize with a geolocation object' do
    expect(@decorator).to be_an_instance_of(GeolocationDecorator)
  end

  it 'can call all the methods of Gelocation' do
    expect(@decorator).to respond_to(:address_components)
    expect(@decorator).to respond_to(:lat_long)
    expect(@decorator).to respond_to(:city)
    expect(@decorator).to respond_to(:state)
    expect(@decorator).to respond_to(:country)
    expect(@decorator).to respond_to(:latitude)
    expect(@decorator).to respond_to(:longitude)
    expect(@decorator).to respond_to(:lat_long_string)
  end

  describe 'instance methods' do
    it '#location_info' do
      expect(@decorator.location_info).to be_a LocationInfo
    end
  end
end

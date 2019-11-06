require 'rails_helper'

describe LocationInfo do
  it 'can initialize with keywords' do
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

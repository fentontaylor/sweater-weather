require 'mock_helper'

describe 'GeocodeService' do
  it 'takes a city and returns parsed json from Google Geolocation API' do
    stub_denver_location
    service = GeocodeService.new('denver,co')
    data = service.get_location

    expect(data).to have_key(:results)

    results = data[:results].first

    expect(results).to have_key(:address_components)
    expect(results).to have_key(:formatted_address)
    expect(results).to have_key(:geometry)
    expect(results).to have_key(:place_id)
  end
end

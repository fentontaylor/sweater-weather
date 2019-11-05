require 'mock_helper'

describe RoadTripService do
  WebMock.allow_net_connect!
  it 'takes origin and destination and returns data from Google Directions API' do
    service = RoadTripService.new(origin: 'Denver,CO', destination: 'Pueblo,CO')
    data = service.get_directions

    duration = data[:routes].first[:legs].first[:duration]
    expect(duration).to have_key(:text)
    expect(duration).to have_key(:value)
  end
end

require 'mock_helper'

describe RoadTripService do
  it 'takes origin and destination and returns data from Google Directions API' do
    stub_denver_to_pueblo_directions

    service = RoadTripService.new('Denver,CO', 'Pueblo,CO')
    data = service.get_directions

    duration = data[:routes].first[:legs].first[:duration]
    expect(duration).to have_key(:text)
    expect(duration).to have_key(:value)
  end
end

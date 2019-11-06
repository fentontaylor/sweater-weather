require 'rails_helper'

describe RoadTrip, type: :model do
  before :each do
    json = File.read('./spec/fixtures/directions_denver_to_pueblo.json')
    data = JSON.parse(json, symbolize_names: true)
    @road_trip = RoadTrip.new(data)
  end

  it 'can initialize with a hash' do
    expect(@road_trip).to be_an_instance_of(RoadTrip)
  end

  it 'attributes' do
    expect(@road_trip.origin).to eq('Denver, CO, USA')
    expect(@road_trip.destination).to eq('Pueblo, CO, USA')
    expect(@road_trip.approx_travel_time).to eq('1 hour 48 mins')
    expect(@road_trip.travel_seconds).to eq(6450)
  end
end

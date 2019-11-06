require 'mock_helper'

describe 'POST /api/v1/road_trip', type: :request do
  WebMock.allow_net_connect!
  before :each do
    stub_denver_to_pueblo_directions
    stub_pueblo_future_forecast

    # Timecop.freeze(Time.at 1573009319)
    @user = User.create(email: 'bob@ross.com', password: 'tree', password_confirmation: 'tree' )

    @body = {
      "origin" => "Denver,CO",
      "destination" => "Pueblo,CO",
      "api_key" => "#{@user.api_key}"
    }.to_json

    @headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
  end

  it 'returns a forecast for estimated arrival time in destination city' do
    # frozen_time = Time.at 1573009319
    # Time.stubs(:now).returns(frozen_time)
    post '/api/v1/road_trip', params: @body, headers: @headers

    expect(response.status).to eq(200)

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to have_key(:data)
    expect(data[:data][:id]).to be_nil
    expect(data[:data][:type]).to eq('road_trip')

    attributes = data[:data][:attributes]
    expect(attributes[:temperature]).to eq(40)
    expect(attributes[:summary]).to eq('Clearly')
    expect(attributes[:approx_travel_time]).to eq('5555')
  end

  it 'returns status 401 with error message if key invalid' do
    body = {
      "origin" => "Denver,CO",
      "destination" => "Pueblo,CO",
      "api_key" => "#{@user.api_key}+invalidation"
    }.to_json

    post '/api/v1/road_trip', params: body, headers: @headers

    expect(response.status).to eq(401)

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:status]).to eq(401)
    expect(data[:errors]).to eq('Invalid or missing key')
  end

  it 'returns status 401 with error message if key missing' do
    body = {
      "origin" => "Denver,CO",
      "destination" => "Pueblo,CO"
    }.to_json

    post '/api/v1/road_trip', params: body, headers: @headers

    expect(response.status).to eq(401)

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:status]).to eq(401)
    expect(data[:errors]).to eq('Invalid or missing key')
  end
end

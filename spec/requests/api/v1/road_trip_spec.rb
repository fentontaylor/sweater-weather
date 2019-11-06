require 'mock_helper'

describe 'POST /api/v1/road_trip', type: :request do

  before :each do
    stub_denver_to_pueblo_directions
    stub_pueblo_future_forecast

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
    post '/api/v1/road_trip', params: @body, headers: @headers

    expect(response.status).to eq(200)

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to have_key(:data)
    expect(data[:data][:id]).to be_nil
    expect(data[:data][:type]).to eq('road_trip')

    attributes = data[:data][:attributes]
    expect(attributes[:temperature]).to eq(41.31)
    expect(attributes[:summary]).to eq('Clear')
    expect(attributes[:approx_travel_time]).to eq('1 hour 48 mins')
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

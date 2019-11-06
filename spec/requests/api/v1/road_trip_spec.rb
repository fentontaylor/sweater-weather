require 'mock_helper'

describe 'POST /api/v1/road_trip', type: :request do
  WebMock.allow_net_connect!
  before :each do
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
    binding.pry
    expect(data).to have_key(:data)
    expect(data[:data][:id]).to be_nil
    expect(data[:data][:type]).to eq('road_trip')

    attributes = data[:data][:attributes]
    expect(attributes[:temperature]).to eq(40)
    expect(attributes[:summary]).to eq('Clearly')
    expect(attributes[:approx_travel_time]).to eq('5555')
  end
end

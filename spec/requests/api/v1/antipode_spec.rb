require 'mock_helper'

describe '/api/v1/antipode?location={city} endpoint' do
  it 'returns the weather at an antipode city' do
    stub_hong_kong_location
    stub_jujuy_location
    stub_amypode_hong_kong
    stub_jujuy_forecast

    get '/api/v1/antipode?location=Hong Kong'

    expect(response).to be_successful

    expected = {
      data: {
        id: 1,
        type: 'antipode',
        search_location: 'Hong Kong',
        attributes: {
          location_name: "RP69, Jujuy, Argentina",
          forecast: {
            summary: 'Mostly Cloudy',
            current_temperature: 70.29,
          }
        }
      }
    }

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to eq(expected)
  end
end

require 'mock_helper'

describe '/api/v1/antipode?location={city} endpoint' do
  it 'returns the weather at an antipode city' do
    WebMock.allow_net_connect!

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
            summary: 'Clear',
            current_temperature: 75.64,
          }
        }
      }
    }

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to eq(expected)
  end
end

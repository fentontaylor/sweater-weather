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
        attributes: {
          location_name: 'Antipode City Name',
          forecast: {
            summary: 'Mostly Cloudy',
            current_temperature: 72,
          },
          search_location: 'Hong Kong'
        }
      }
    }

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to eq(expected)
  end
end

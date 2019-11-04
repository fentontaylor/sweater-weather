require 'rails_helper'

describe '/api/v1/backgrounds endpoint' do
  WebMock.allow_net_connect!
  it 'returns a background image for a given city' do
    get '/api/v1/backgrounds?'
    expect(response).to be_successful

    result = JSON.parse(response.body)
    expect(result).to have_key(:data)
    expect(result[:data][:id]).to eq(1)
    expect(result[:data][:type]).to eq('background image')
    expect(result[:data][:attributes][:img_url]).to be_a String
  end
end

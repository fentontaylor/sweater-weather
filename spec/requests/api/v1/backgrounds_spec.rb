require 'mock_helper'

describe '/api/v1/backgrounds endpoint' do
  it 'returns a background image for a given city' do
    stub_denver_images

    get '/api/v1/backgrounds?location=denver,co'
    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result).to have_key(:data)
    expect(result[:data][:id]).to eq(1)
    expect(result[:data][:type]).to eq('background image')
    expect(result[:data][:attributes][:img_url]).to be_a String
  end
end

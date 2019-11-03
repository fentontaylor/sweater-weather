require 'mock_helper'

describe '/api/v1/forecast endpoint' do
  it 'returns forecast data for a specific city' do
    stub_denver_location

    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:data][:location][:city]).to eq('Denver')
    expect(data[:data][:location][:state]).to eq('CO')
    expect(data[:data][:location][:country]).to eq('United States')
    expect(data[:data][:location][:latitude]).to eq(39.7392358)
    expect(data[:data][:location][:longitude]).to eq(-104.990251)

    
  end
end

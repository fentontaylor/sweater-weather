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

    expect(data[:data][:current][:time]).to eq('4:26 PM')
    expect(data[:data][:current][:date]).to eq('11/02')
    expect(data[:data][:current][:summary]).to eq('Partly Cloudy')
    expect(data[:data][:current][:icon]).to eq('partly-cloudy-day')
    expect(data[:data][:current][:temperature]).to eq(44.26)
    expect(data[:data][:current][:feels_like]).to eq(40.75)
    expect(data[:data][:current][:humidity]).to eq(0.42)
    expect(data[:data][:current][:visibility]).to eq(10)
    expect(data[:data][:current][:uv_index]).to eq(1)

    expect(data[:data][:summary][:today]).to eq('Partly cloudy throughout the day.')
    expect(data[:data][:summary][:tonight]).to eq('Clear')
    expect(data[:data][:summary][:temp_high]).to eq(51.75)
    expect(data[:data][:summary][:temp_low]).to eq(27.56)
  end
end

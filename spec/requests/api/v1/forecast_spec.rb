require 'mock_helper'

describe '/api/v1/forecast endpoint', type: :request do
  it 'returns forecast data for a specific city' do
    stub_denver_location
    stub_denver_forecast

    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)

    location = data[:data][:attributes][:location]
    expect(location[:city]).to eq('Denver')
    expect(location[:state]).to eq('CO')
    expect(location[:country]).to eq('United States')
    expect(location[:latitude]).to eq(39.7392358)
    expect(location[:longitude]).to eq(-104.990251)

    summary = data[:data][:attributes][:summary]
    expect(summary[:today]).to eq('Partly cloudy throughout the day.')
    expect(summary[:tonight]).to eq('Clear')
    expect(summary[:temp_high]).to eq(51.75)
    expect(summary[:temp_low]).to eq(27.56)

    current = data[:data][:attributes][:current]
    expect(current[:time]).to eq('4:26 PM')
    expect(current[:date]).to eq('11/02')
    expect(current[:summary]).to eq('Partly Cloudy')
    expect(current[:icon]).to eq('partly-cloudy-day')
    expect(current[:temperature]).to eq(44.26)
    expect(current[:feels_like]).to eq(40.75)
    expect(current[:humidity]).to eq(0.42)
    expect(current[:visibility]).to eq(10)
    expect(current[:uv_index]).to eq(1)

    hourly = data[:data][:attributes][:hourly]
    expect(hourly.count).to eq(8)
    expect(hourly.first[:time]).to eq('4 PM')
    expect(hourly.first[:icon]).to eq("partly-cloudy-day")
    expect(hourly.first[:temperature]).to eq(45.41)

    daily = data[:data][:attributes][:daily]
    expect(daily.count).to eq(5)
    expect(daily.first[:day]).to eq('Saturday')
    expect(daily.first[:icon]).to eq('clear-day')
    expect(daily.first[:precip_probability]).to eq('8%')
    expect(daily.first[:precip_type]).to eq('snow')
    expect(daily.first[:temp_high]).to eq(51.75)
    expect(daily.first[:temp_low]).to eq(27.56)
  end
end

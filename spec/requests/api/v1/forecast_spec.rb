require 'mock_helper'

describe '/api/v1/forecast endpoint' do
  it 'returns forecast data for a specific city' do
    stub_denver_location
    stub_denver_forecast

    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data[:data][:location][:city]).to eq('Denver')
    expect(data[:data][:location][:state]).to eq('CO')
    expect(data[:data][:location][:country]).to eq('United States')
    expect(data[:data][:location][:latitude]).to eq(39.7392358)
    expect(data[:data][:location][:longitude]).to eq(-104.990251)

    forecast = data[:data][:forecast]
    expect(forecast[:current][:time]).to eq('4:26 PM')
    expect(forecast[:current][:date]).to eq('11/02')
    expect(forecast[:current][:summary]).to eq('Partly Cloudy')
    expect(forecast[:current][:icon]).to eq('partly-cloudy-day')
    expect(forecast[:current][:temperature]).to eq(44.26)
    expect(forecast[:current][:feels_like]).to eq(40.75)
    expect(forecast[:current][:humidity]).to eq(0.42)
    expect(forecast[:current][:visibility]).to eq(10)
    expect(forecast[:current][:uv_index]).to eq(1)

    expect(forecast[:summary][:today]).to eq('Partly cloudy throughout the day.')
    expect(forecast[:summary][:tonight]).to eq('Clear')
    expect(forecast[:summary][:temp_high]).to eq(51.75)
    expect(forecast[:summary][:temp_low]).to eq(27.56)

    hourly = forecast[:hourly][:data]
    expect(hourly.count).to eq(8)
    expect(hourly.first[:time]).to eq('4 PM')
    expect(hourly.first[:icon]).to eq("partly-cloudy-day")
    expect(hourly.first[:temperature]).to eq(45.41)

    daily = forecast[:daily][:data]
    expect(daily.count).to eq(5)
    expect(daily.first[:day]).to eq('Saturday')
    expect(daily.first[:icon]).to eq('clear-day')
    expect(daily.first[:precip_probability]).to eq('8%')
    expect(daily.first[:precip_type]).to eq('snow')
    expect(daily.first[:temp_high]).to eq(51.75)
    expect(daily.first[:temp_low]).to eq(27.56)
  end
end

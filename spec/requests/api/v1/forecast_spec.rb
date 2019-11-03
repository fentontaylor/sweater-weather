require 'rails_helper'

describe '/api/v1/forecast endpoint' do
  it 'returns forecast data for a specific city' do
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)
    
  end
end

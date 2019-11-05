require 'rails_helper'

describe ForecastCurrent do
  it 'can initialize with keyword arguments' do
    forecast =
      ForecastCurrent.new(
        time: 'time',
        date: 'date',
        summary: 'summary_current',
        icon: 'icon',
        temperature: 'temp_current',
        feels_like: 'feels_like',
        humidity: 'humidity',
        visibility: 'visibility',
        uv_index: 'uv_index'
      )
    expect(forecast).to be_an_instance_of(ForecastCurrent)
  end
end

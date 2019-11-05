require 'rails_helper'

describe ForecastDaily do
  it 'can initialize with keyword arguments' do
    forecast =
      ForecastDaily.new(
        day: 'day',
        icon: 'icon',
        precip_probability: 'pct',
        precip_type: 'type',
        temp_high: 'high',
        temp_low: 'low'
      )
    expect(forecast).to be_an_instance_of(ForecastDaily)
  end
end

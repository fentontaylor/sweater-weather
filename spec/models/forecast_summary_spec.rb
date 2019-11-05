require 'rails_helper'

describe ForecastSummary do
  it 'can initialize with keyword arguments' do
    forecast =
      ForecastSummary.new(
        today: 'summary_today',
        tonight: 'summary_tonight',
        temp_high: 'temp_high',
        temp_low: 'temp_low'
      )
    expect(forecast).to be_an_instance_of(ForecastSummary)
  end
end

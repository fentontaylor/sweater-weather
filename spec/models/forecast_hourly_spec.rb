require 'rails_helper'

describe ForecastHourly do
  it 'can initialize with keyword arguments' do
    forecast =
      ForecastHourly.new(
        time: 'time',
        icon: 'icon',
        temperature: 'temp'
      )
    expect(forecast).to be_an_instance_of(ForecastHourly)
  end
end

class Forecast
  attr_reader :temp_current,
              :temp_high,
              :temp_low,
              :feels_like,
              :humidity,
              :visibility,
              :uv_index,
              :icon,
              :summary_current,
              :summary_today,
              :current_time

  def initialize(hash)
    @temp_current = hash[:currently][:temperature]
    @temp_high = hash[:daily][:data].first[:temperatureHigh]
    @temp_low = hash[:daily][:data].first[:temperatureLow]
    @feels_like = hash[:currently][:apparentTemperature]
    @humidity = hash[:currently][:humidity]
    @visibility = hash[:currently][:visibility]
    @uv_index = hash[:currently][:uvIndex]
    @icon = hash[:currently][:icon]
    @summary_current = hash[:currently][:summary]
    @summary_today = hash[:hourly][:summary]
    @current_time = hash[:currently][:time]
  end
end

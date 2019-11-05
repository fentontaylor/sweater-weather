class ForecastDecorator < SimpleDelegator
  def initialize(forecast)
    @forecast = super(forecast)
  end

  def summary
    ForecastSummary.new(
      today: summary_today,
      tonight: summary_tonight,
      temp_high: temp_high,
      temp_low: temp_low
    )
  end

  def current_forecast
    ForecastCurrent.new(
      time: time,
      date: date,
      summary: summary_current,
      icon: icon,
      temperature: temp_current,
      feels_like: feels_like,
      humidity: humidity,
      visibility: visibility,
      uv_index: uv_index
    )
  end

  def hourly_forecast
    next_8_hours = hourly[:data].first(8)
    next_8_hours.map do |hour|
      ForecastHourly.new(
        time: time_abbr(hour[:time], :hour),
        icon: hour[:icon],
        temperature: hour[:temperature]
      )
    end
  end

  def daily_forecast
    next_5_days = daily[:data].first(5)
    next_5_days.map do |day|
      ForecastDaily.new(
        day: time_abbr(day[:time], :day),
        icon: day[:icon],
        precip_probability: convert_pct(day[:precipProbability]),
        precip_type: day[:precipType],
        temp_high: day[:temperatureHigh],
        temp_low: day[:temperatureLow]
      )
    end
  end

  private

  def summary_tonight
    time = get_midnight_timestamp
    midnight_forecast = hourly[:data].find { |t| t[:time] == time }
    midnight_forecast[:summary]
  end

  def time
    time_obj.strftime("%l:%M %p").strip
  end

  def date
    time_obj.strftime("%m/%d")
  end

  def convert_pct(pct)
    (pct * 100).to_i.to_s + '%'
  end

  def time_abbr(time, format)
    t = Time.at time
    case format
    when :hour then t.strftime("%l %p").strip
    when :day then t.strftime("%A")
    end
  end

  def time_obj
    @time_obj ||= Time.at current_time
  end

  def get_midnight_timestamp
    seconds_to_midnight = time_obj.seconds_until_end_of_day + 1
    current_time + seconds_to_midnight
  end
end

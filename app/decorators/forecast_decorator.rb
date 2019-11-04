class ForecastDecorator < SimpleDelegator
  def initialize(forecast)
    @forecast = super(forecast)
  end

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

  def hourly_forecast
    next_8_hours = hourly[:data].first(8)
    next_8_hours.map do |hour|
      {
        time: short_time(hour[:time]),
        icon: hour[:icon],
        temperature: hour[:temperature]
      }
    end
  end

  private

  def short_time(time)
    t = Time.at time
    t.strftime("%l %p").strip
  end

  def time_obj
    @time_obj ||= Time.at current_time
  end

  def get_midnight_timestamp
    seconds_to_midnight = time_obj.seconds_until_end_of_day + 1
    current_time + seconds_to_midnight
  end
end

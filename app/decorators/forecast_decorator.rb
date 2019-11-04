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

  private

  def time_obj
    @time_obj ||= Time.at current_time
  end

  def get_midnight_timestamp
    seconds_to_midnight = time_obj.seconds_until_end_of_day + 1
    current_time + seconds_to_midnight
  end
end

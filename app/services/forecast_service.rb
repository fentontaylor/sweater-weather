class ForecastService
  include ApiFetchable

  def initialize(location, time = nil)
    @location = location
    @future_time = time
  end

  def request_path
    "https://api.darksky.net/forecast/" \
      "#{ENV['darksky_api_key']}/#{@location}#{time_param}?exclude=minutely,flags"
  end

  def get_forecast
    retrieve_data(request_path)
  end

  private

  def time_param
    return '' unless @future_time

    ",#{Time.now.to_i + @future_time}"
  end
end

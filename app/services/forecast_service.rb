class ForecastService
  include ApiFetchable

  def initialize(location)
    @location = location
  end

  def request_path
    "https://api.darksky.net/forecast/" \
      "#{ENV['darksky_api_key']}/#{@location}?exclude=minutely,flags"
  end

  def get_forecast
    retrieve_data(request_path)
  end
end

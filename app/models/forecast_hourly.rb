class ForecastHourly
  def initialize(obj, hour)
    @time = obj.time_abbr(hour[:time], :hour)
    @icon = hour[:icon]
    @temperature = hour[:temperature]
  end
end

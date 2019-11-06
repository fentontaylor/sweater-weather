class ForecastCurrent
  def initialize(obj)
    @time = obj.time
    @date = obj.date
    @summary = obj.summary_current
    @icon = obj.icon
    @temperature = obj.temp_current
    @feels_like = obj.feels_like
    @humidity = obj.humidity
    @visibility = obj.visibility
    @uv_index = obj.uv_index
  end
end

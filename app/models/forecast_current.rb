class ForecastCurrent
  def initialize(args)
    @time = args[:time]
    @date = args[:date]
    @summary = args[:summary]
    @icon = args[:icon]
    @temperature = args[:temperature]
    @feels_like = args[:feels_like]
    @humidity = args[:humidity]
    @visibility = args[:visibility]
    @uv_index = args[:uv_index]
  end
end

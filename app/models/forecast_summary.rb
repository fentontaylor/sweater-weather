class ForecastSummary
  def initialize(obj)
    @today = obj.summary_today
    @tonight = obj.summary_tonight
    @temp_high = obj.temp_high
    @temp_low = obj.temp_low
  end
end

class ForecastDaily
  def initialize(obj, day)
    @day = obj.time_abbr(day[:time], :day)
    @icon = day[:icon]
    @precip_probability = obj.convert_pct(day[:precipProbability])
    @precip_type = day[:precipType]
    @temp_high = day[:temperatureHigh]
    @temp_low = day[:temperatureLow]
  end
end

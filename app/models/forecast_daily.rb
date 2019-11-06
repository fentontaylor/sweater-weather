class ForecastDaily
  def initialize(args)
    @day = args[:day]
    @icon = args[:icon]
    @precip_probability = args[:precip_probability]
    @precip_type = args[:precip_type]
    @temp_high = args[:temp_high]
    @temp_low = args[:temp_low]
  end
end

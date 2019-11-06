class ForecastSummary
  def initialize(args)
    @today = args[:today]
    @tonight = args[:tonight]
    @temp_high = args[:temp_high]
    @temp_low = args[:temp_low]
  end
end

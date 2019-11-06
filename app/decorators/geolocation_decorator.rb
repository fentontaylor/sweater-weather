class GeolocationDecorator < SimpleDelegator
  def initialize(geolocation)
    @geolocation = super(geolocation)
  end

  def location_info
    LocationInfo.new(self)
  end
end

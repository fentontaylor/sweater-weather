class GeolocationDecorator < SimpleDelegator
  def initialize(geolocation)
    @geolocation = super(geolocation)
  end

  def location_info
    LocationInfo.new(
      city: city,
      state: state,
      country: country,
      latitude: latitude,
      longitude: longitude
    )
  end
end

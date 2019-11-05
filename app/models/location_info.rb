class LocationInfo
  def initialize(args)
    @city = args[:city]
    @state = args[:state]
    @country = args[:country]
    @latitude = args[:latitude]
    @longitude = args[:longitude]
  end
end

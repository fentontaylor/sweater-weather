class Antipode
  attr_reader :latitude, :longitude

  def initialize(hash)
    @latitude = hash[:data][:attributes][:lat]
    @longitude = hash[:data][:attributes][:long]
  end

  def lat_long_string
    "#{@latitude},#{@longitude}"
  end
end

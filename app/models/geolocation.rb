class Geolocation
  attr_reader :address_components, :lat_long

  def initialize(hash)
    @address_components = hash[:results].first[:address_components]
    @lat_long = hash[:results].first[:geometry][:location]
  end

  def city
    extract_location('locality')[:long_name]
  end

  def state
    extract_location('administrative_area_level_1')[:short_name]
  end

  def country
    extract_location('country')[:long_name]
  end

  def latitude
    @lat_long[:lat]
  end

  def longitude
    @lat_long[:lng]
  end

  def lat_long_string
    @lat_long.values.join(',')
  end

  private

  def extract_location(type)
    @address_components.find { |loc| loc[:types].first == type }
  end
end

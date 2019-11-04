class Api::V1::AntipodesController < ApplicationController
  def index
    geo_service = GeocodeService.new(params[:location])
    geolocation = Geolocation.new(geo_service.get_location)
    service = AntipodeService.new(geolocation.lat_long)

    render json: {message:'test'}
  end
end

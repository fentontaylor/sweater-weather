class Api::V1::AntipodesController < ApplicationController
  def index


    presenter = AntipodePresenter.new(params[:location])
    # geo_service = GeocodeService.new(params[:location])
    # geolocation = Geolocation.new(geo_service.get_location)
    # antip_service = AntipodeService.new(geolocation.lat_long)
    render json: AntipodeSerializer.new(presenter).json
  end
end

class Api::V1::RoadTripsController < ApplicationController
  def create
    body = read_body(request)
    if User.find_by(api_key: body[:api_key])
      facade = RoadTripFacade.new(body)
      render json: RoadTripSerializer.new(facade)
    end
  end
end

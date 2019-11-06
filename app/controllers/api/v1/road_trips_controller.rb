class Api::V1::RoadTripsController < ApplicationController
  def create
    body = read_body(request)
    if User.find_by(api_key: body[:api_key])
      facade = RoadTripFacade.new(body)
      render json: RoadTripSerializer.new(facade)
    else
      render_error_response
    end
  end

  private

  def render_error_response
    render json: { status: 401, errors: 'Invalid or missing key' }, status: 401
  end
end

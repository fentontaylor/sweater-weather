class Api::V1::ForecastController < ApplicationController
  def index
    facade = ForecastFacade.new(params[:location])
    render json: ForecastSerializer.new(facade)
  end
end

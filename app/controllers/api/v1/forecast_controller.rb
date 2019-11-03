class Api::V1::ForecastController < ApplicationController
  def index
    presenter = ForecastPresenter.new(params[:location])
    render json: ForecastSerializer.new(presenter).json
  end
end

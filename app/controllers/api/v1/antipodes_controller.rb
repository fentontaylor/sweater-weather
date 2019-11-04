class Api::V1::AntipodesController < ApplicationController
  def index
    presenter = AntipodePresenter.new(params[:location])
    render json: AntipodeSerializer.new(presenter).json
  end
end

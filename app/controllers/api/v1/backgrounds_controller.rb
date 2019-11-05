class Api::V1::BackgroundsController < ApplicationController
  def index
    presenter = BackgroundImagePresenter.new(params[:location])
    render json: BackgroundImageSerializer.new(presenter)
  end
end

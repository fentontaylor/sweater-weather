class Api::V1::BackgroundsController < ApplicationController
  def index
    facade = BackgroundImageFacade.new(params[:location])
    render json: BackgroundImageSerializer.new(facade)
  end
end

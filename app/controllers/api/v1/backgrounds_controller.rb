class Api::V1::BackgroundsController < ApplicationController
  def index
    service = BackgroundImgService.new(params[:location])
    img = BackgroundImg.new(service.get_background_imgs)
    render json: BackgroundImgSerializer.new(img).json
  end
end

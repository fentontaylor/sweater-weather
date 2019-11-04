class Api::V1::AntipodesController < ApplicationController
  def index
    service = AntipodeService.new(params[:location])
    render json: {message:'test'}
  end
end

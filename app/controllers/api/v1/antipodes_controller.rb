class Api::V1::AntipodesController < ApplicationController
  def index
    render json: {message:'test'}
  end
end

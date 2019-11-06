class ErrorsController < ApplicationController
  def index
    render json: {
      status: 400,
      errors: 'Endpoint does not exist or has syntax error'
    }, status: 400
  end
end

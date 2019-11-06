class ErrorsController < ApplicationController
  def index
    render json: {
      status: 400,
      errors: 'Path to endpoint does not exist or has syntax error'
    }, status: 400
  end
end

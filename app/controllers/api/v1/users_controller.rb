class Api::V1::UsersController < ApplicationController
  def create
    user_params = read_body(request)
    user = User.new(user_params)
    if user.save
      render json: { api_key: user.api_key }, status: 201
    else
      errors = user.errors.full_messages.to_sentence
      render json: { errors: "Invalid credentials: #{errors}"}, status: 400
    end
  end
end

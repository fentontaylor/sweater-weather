class Api::V1::SessionsController < ApplicationController
  def create
    session_params = read_body(request)
    user = User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      render_success(user)
    else
      render_unauthorized
    end
  end

  private

  def render_success(user)
    render json: { api_key: user.api_key }, status: 200
  end

  def render_unauthorized
    render json: { errors: 'Invalid email or password' }, status: 401
  end
end

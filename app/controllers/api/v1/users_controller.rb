class Api::V1::UsersController < ApplicationController
  def create
    user_params = JSON.parse(request.body.read)
    User.create(user_params)
    
  end
end

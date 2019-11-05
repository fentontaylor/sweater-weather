class Api::V1::SessionsController < ApplicationController
  def create
    session_params = read_body(request)

    binding.pry
  end
end

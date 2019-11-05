class ApplicationController < ActionController::API
  def read_body(request)
    JSON.parse(request.body.read, symbolize_names: true)
  end
end

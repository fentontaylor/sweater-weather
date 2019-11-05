require 'mock_helper'

describe 'POST /api/v1/road_trip', type: :request do
  before :each do
    @user = User.create(email: 'bob@ross.com', password: 'tree', password_confirmation: 'tree' )

    @body = {
      "origin" => "Denver,CO",
      "destination" => "Pueblo,CO",
      "api_key" => "#{@user.api_key}"
    }.to_json
  end

  it 'returns a forecast for estimated arrival time in destination city' do

  end
end

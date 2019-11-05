require 'rails_helper'

describe 'POST request with credentials sent to /api/v1/sessions', type: :request do
  before :each do
    @user = User.create(email: 'bob@ross.com', password: 'tree', password_confirmation: 'tree' )

    @credentials = '{
      "email": "bob@ross.com",
      "password": "tree"
    }'

    @headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
  end

  context 'POST body contains correct credentials' do
    it 'creates a session and returns their api key'  do
      post '/api/v1/sessions', params: @credentials, headers: @headers

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(body[:api_key]).to be_a String
      expect(body[:api_key].length).to eq(48)
    end
  end

  context 'POST body contains incorrect credentials' do
    it 'returns error message, status 401'  do
      bad_credentials = '{
        "email": "bob@ross.com",
        "password": "tree_is_bad"
      }'

      post '/api/v1/sessions', params: bad_credentials, headers: @headers

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(401)
      expect(body[:errors]).to eq('Invalid email or password')
    end
  end
end

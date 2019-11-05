require 'rails_helper'

describe 'User sends post request with credentials', type: :request do
  it 'creates a new user if the email is unique' do

    credentials = '{
      "email": "bob@ross.com",
      "password": "happy",
      "password_confirmation": "happy"
    }'

    headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    post '/api/v1/users', params: credentials, headers: headers
    expect(response).to be_successful
  end
end

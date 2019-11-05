require 'rails_helper'

describe 'User sends post request with credentials', type: :request do
  before :each do
    @credentials = '{
      "email": "bob@ross.com",
      "password": "happy",
      "password_confirmation": "happy"
    }'

    @headers = {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
  end

  it 'creates a new user if the email is unique' do
    post '/api/v1/users', params: @credentials, headers: @headers

    body = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
    expect(body[:api_key]).to be_a String
    expect(body[:api_key].length).to eq(48)
  end

  it 'returns error message if email taken' do
    post '/api/v1/users', params: @credentials, headers: @headers
    post '/api/v1/users', params: @credentials, headers: @headers

    body = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(400)
    expect(body[:errors]).to eq('Invalid credentials: Email has already been taken')
  end

  it 'returns error message if email taken' do
    post '/api/v1/users', params: @credentials, headers: @headers

    bad_password = '{
      "email": "bobbo@rossy.net",
      "password": "happy",
      "password_confirmation": "sad"
    }'
    post '/api/v1/users', params: bad_password, headers: @headers

    body = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(400)
    expect(body[:errors]).to eq("Invalid credentials: Password confirmation doesn't match Password")
  end
end

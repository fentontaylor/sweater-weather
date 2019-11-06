require 'rails_helper'

describe 'A request is sent to non-existant endpoint/typo' do
  it 'returns 400 response with error message' do
    get '/api/v1/this-is-not-an-endpoint'

    data = JSON.parse(response.body)

    expect(response.status).to eq(400)
    expect(data['status']).to eq(400)
    expect(data['errors']).to eq('Endpoint does not exist or has syntax error')
  end
end

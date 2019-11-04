require 'mock_helper'

describe AntipodeService do
  it 'takes a location and returns lat/lng of antipode' do
    stub_amypode_hong_kong

    service = AntipodeService.new({:lat=>22.3193039, :lng=>114.1693611})

    response = {
      data: {
        id: '1',
        type: 'antipode',
        attributes: {
            lat: -22.3193039,
            long: -65.8306389
        }
      }
    }
    expect(service.get_antipode).to eq(response)
  end
end

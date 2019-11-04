require 'mock_helper'

describe AntipodeService do
  it 'takes a location and returns lat/lng of antipode' do
    WebMock.allow_net_connect!
    service = AntipodeService.new('hongkong')

    response = {
      data: {
        id: 1,
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

require 'mock_helper'

describe BackgroundImgService do
  WebMock.allow_net_connect!
  it 'take a location and returns data from Unsplash API' do
    service = BackgroundImgService.new('denver,co')

    data = service.get_background_img

    expect(data).to have_key(:results)
    expect(data[:results]).to be_an Array
    expect(data[:results][:urls]).to be_a Hash
    expect(data[:results][:urls]).to have_key(:full)
  end
end

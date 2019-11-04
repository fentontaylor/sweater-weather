require 'mock_helper'

describe BackgroundImgService do
  it 'take a location and returns data from Unsplash API' do
    stub_denver_images
    
    service = BackgroundImgService.new('denver,co')

    data = service.get_background_img

    expect(data).to have_key(:results)
    expect(data[:results]).to be_an Array
    expect(data[:results].first[:urls]).to be_a Hash
    expect(data[:results].first[:urls]).to have_key(:full)
  end
end

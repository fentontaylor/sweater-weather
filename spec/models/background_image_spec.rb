require 'mock_helper'

describe BackgroundImage do
  before :each do
    stub_denver_images
    service = BackgroundImageService.new('denver,co')
    data = service.get_background_imgs
    @bg_img = BackgroundImage.new(data)
  end

  it 'can initialize with a hash' do
    expect(@bg_img).to be_an_instance_of(BackgroundImage)
  end

  it 'attributes' do
    expect(@bg_img.results).to be_a Array
  end

  describe 'instance methods' do
    it '#random_url' do
      expect(@bg_img.random_url).to include('https://images.unsplash.com/photo')
    end
  end
end

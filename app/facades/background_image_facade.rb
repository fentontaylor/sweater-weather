class BackgroundImageFacade
  attr_reader :id, :type

  def initialize(location)
    @location = location
    @id = nil
    @type = 'background_image'
  end

  def random_url
    image.random_url
  end

  private

  def img_service
    @img_service ||= BackgroundImageService.new(@location)
  end

  def image
    @image ||= BackgroundImage.new(img_service.get_background_imgs)
  end
end

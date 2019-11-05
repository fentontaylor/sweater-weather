class BackgroundImagePresenter
  def initialize(location)
    @location = location
  end

  def data
    {
      id: 1,
      type: 'background image',
      attributes: {
        img_url: image.random_url
      }
    }
  end

  private

  def img_service
    @img_service ||= BackgroundImageService.new(@location)
  end

  def image
    @image ||= BackgroundImage.new(img_service.get_background_imgs)
  end
end

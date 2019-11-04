class BackgroundImgSerializer
  def initialize(img)
    @image = img.random_url
  end

  def json
    {
      data: {
        id: 1,
        type: 'background image',
        attributes: {
          img_url: @image
        }
      }
    }
  end
end

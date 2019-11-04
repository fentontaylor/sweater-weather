class BackgroundImgService
  include ApiFetchable

  def initialize(location)
    @location = location
  end

  def get_background_img
    parse_json(fetch_data)
  end

  private

  def fetch_data
    Faraday.get('https://api.unsplash.com/search/photos') do |req|
      req.headers['Authorization'] = "Client-ID #{ENV['unsplash_key']}"
      req.params = {
        query: "#{city} skyline",
        orientation: 'landscape',
        per_page: 50
      }
    end
  end

  def city
    @location.split(',').first
  end
end

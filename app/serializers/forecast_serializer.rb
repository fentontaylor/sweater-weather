class ForecastSerializer
  def initialize(presenter)
    @presenter = presenter
  end

  def json
    {
      data: {
        location: location_data
      }
    }
  end

  private

  def location_data
    {
      city: @presenter.city,
      state: @presenter.state,
      country: @presenter.country,
      latitude: @presenter.latitude,
      longitude: @presenter.longitude
    }
  end
end

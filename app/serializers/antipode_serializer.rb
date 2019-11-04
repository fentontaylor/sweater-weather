class AntipodeSerializer
  def initialize(presenter)
    @presenter = presenter
  end

  def json
    {
      data: {
        id: 1,
        type: 'antipode',
        search_location: @presenter.location,
        attributes: {
          location_name: @presenter.antipode_city,
          forecast: forecast_data
        }
      }
    }
  end

  private

  def forecast_data
    {
      summary: @presenter.weather_summary,
      current_temperature: @presenter.temp_current
    }
  end
end

class ForecastSerializer
  def initialize(presenter)
    @presenter = presenter
  end

  def json
    {
      data: {
        location: location_data,
        forecast: {
          current: forecast_current_data,
          summary: forecast_summary_data
        }
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

  def forecast_current_data
    {
      time: @presenter.time,
      date: @presenter.date,
      summary: @presenter.summary_current,
      icon: @presenter.icon,
      temperature: @presenter.current_temp,
      feels_like: @presenter.feels_like,
      humidity: @presenter.humidity,
      visibility: @presenter.visibility,
      uv_index: @presenter.uv_index
    }
  end

  def forecast_summary_data
    {
      today: @presenter.summary_today,
      tonight: @presenter.summary_tonight,
      temp_high: @presenter.temp_high,
      temp_low: @presenter.temp_low
    }
  end
end

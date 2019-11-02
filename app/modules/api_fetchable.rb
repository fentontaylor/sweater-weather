module ApiFetchable
  def api_fetch(path)
    Faraday.get(path)
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end

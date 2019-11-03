module ApiFetchable
  def retrieve_data(path)
    response = api_fetch(path)
    parse_json(response)
  end

  def api_fetch(path)
    Faraday.get(path)
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end

class BackgroundImage
  attr_reader :results

  def initialize(hash)
    @results = hash[:results]
  end

  def random_url
    result = @results.sample
    result[:urls][:full]
  end
end

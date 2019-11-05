class BackgroundImageSerializer
  include FastJsonapi::ObjectSerializer

  attribute :img_url do |obj|
    obj.random_url
  end
end

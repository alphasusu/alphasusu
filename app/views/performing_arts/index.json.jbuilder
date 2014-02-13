json.array!(@performing_arts) do |performing_art|
  json.extract! performing_art, :id
  json.url performing_art_url(performing_art, format: :json)
end

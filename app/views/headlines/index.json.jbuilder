json.array!(@headlines) do |headline|
  json.extract! headline, :id, :title, :body
  json.url headline_url(headline, format: :json)
end

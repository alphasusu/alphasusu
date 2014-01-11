json.array!(@societies) do |society|
  json.extract! society, :id, :name, :description
  json.url society_url(society, format: :json)
end

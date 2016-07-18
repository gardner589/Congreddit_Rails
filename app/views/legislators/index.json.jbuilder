json.array!(@legislators) do |legislator|
  json.extract! legislator, :id, :name, :party, :integer
  json.url legislator_url(legislator, format: :json)
end

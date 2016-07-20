json.array!(@legislator_comments) do |legislator_comment|
  json.extract! legislator_comment, :id, :author, :content
  json.url legislator_comment_url(legislator_comment, format: :json)
end

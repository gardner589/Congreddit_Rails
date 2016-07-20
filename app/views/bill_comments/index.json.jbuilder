json.array!(@bill_comments) do |bill_comment|
  json.extract! bill_comment, :id, :author, :content
  json.url bill_comment_url(bill_comment, format: :json)
end

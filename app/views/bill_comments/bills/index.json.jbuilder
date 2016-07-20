json.array!(@bills) do |bill|
  json.extract! bill, :id, :bill_id, :bill_type, :chamber, :committees, :congress, :history, :introduced, :last_action, :last_vote, :last_version, :official_title, :popular_title, :short_title, :sponsor, :sponsor_bio_id
  json.url bill_url(bill, format: :json)
end

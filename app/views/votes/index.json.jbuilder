json.array!(@votes) do |vote|
  json.extract! vote, :id, :vote_type, :chamber, :congress, :voted_at, :bill_id, :roll_id, :year, :result
  json.url vote_url(vote, format: :json)
end

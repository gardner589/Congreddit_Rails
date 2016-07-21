require 'pry'
require 'httparty'
require 'json'

Legislator.destroy_all
LegislatorComment.destroy_all
Bill.destroy_all
BillComment.destroy_all
Vote.destroy_all

x = 0
while x < 12 do
  x = x+1
  x = x.to_s

  legislators = JSON.parse(HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?per_page=50&page="+x+"&apikey=06b0919993e0438a80c39d53cc99c878").body)["results"]

  legislators.each do |legislator|
    Legislator.create!(first_name: legislator["first_name"], last_name: legislator["last_name"], party: legislator["party"], year_elected: legislator["term_start"], bio_id: legislator["bioguide_id"], chamber: legislator["chamber"], number: x)
  end
  x = x.to_i
end

x = 0
while x < 39 do
  x += 1
  x = x.to_s

  bills = JSON.parse(HTTParty.get("https://congress.api.sunlightfoundation.com/bills?congress=114&bill_type__in=s|hr&history.active=true&page="+x+"&per_page=50&apikey=06b0919993e0438a80c39d53cc99c878").body)["results"]

  bills.each do |bill|
    Bill.create!(bill_id_from_api: bill["bill_id"], bill_type: bill["bill_type"], chamber: bill["chamber"], congress: bill["congress"], history: bill["history"].to_json, introduced: bill["introduced_on"], last_action: bill["last_action_at"],last_vote: bill["last_vote_at"], last_version: bill["last_version"].to_json, official_title: bill["official_title"], short_title: bill["short_title"], sponsor: bill["sponsor"].to_json, sponsor_bio_id: bill["sponsor_id"])

  end
  x = x.to_i
end

x = 0
while x < 10 do
  x += 1
  x = x.to_s

  votes = JSON.parse(HTTParty.get("https://congress.api.sunlightfoundation.com/votes?vote_type=passage&congress=114&fields=voter_ids,bill_id,roll_id,chamber,congress,vote_type,voted_at,year&per_page=50&page="+x+"&apikey=06b0919993e0438a80c39d53cc99c878").body)["results"]

  votes.each do |vote|
    Vote.create!(bill_id: vote["bill_id"], chamber: vote["chamber"], roll_id: vote["roll_id"], result: vote["result"], vote_type: vote["vote_type"], congress: vote["congress"], voted_at: vote["voted_at"], year: vote["year"], voter_ids: vote["voter_ids"].to_json)
  end

  x = x.to_i
end

bill_comments = BillComment.create!([
  {author: "Dave", content: "Whatever about this bill", bill_id: 1},
  {author: "Nelson", content: "I'm a comment content", bill_id: 1},
  {author: "Chris", content: "Great bill! Love the bill! Ducks are so great.", bill_id: 2},
  {author: "Strawberry", content: "I fully endorse any bill involving strawberries", bill_id: 2}
  ])

legis_comments = LegislatorComment.create!([
  {author: "Jerry", content: "Legislator rhymes with Alligator", legislator_id: 1},
  {author: "Kramer", content: "Yeah Yeah Yeah Yeah Yeah Yeah Legislator", legislator_id: 1},
  {author: "Elaine", content: "I'll legislate you", legislator_id: 1},
  {author: "George", content: "Checkout this legislator Jerry!", legislator_id: 2}
  ])

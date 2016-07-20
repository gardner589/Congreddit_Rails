require 'pry'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# ```
# #API Key
#  # * 06b0919993e0438a80c39d53cc99c878
#  # * operator ex. /legislators?apikey=
#  # * https://congress.api.sunlightfoundation.com/legislators?apikey=06b0919993e0438a80c39d53cc99c878
#
#  https://congress.api.sunlightfoundation.com/votes?voter_ids.C001105__exists=true&apikey=06b0919993e0438a80c39d53cc99c878
# ```

require 'httparty'
require 'json'
Legislator.destroy_all
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
while x < 10 do
  x += 1
  x = x.to_s

  votes = JSON.parse(HTTParty.get("https://congress.api.sunlightfoundation.com/votes?vote_type=passage&congress=114&fields=voter_ids,bill_id,roll_id,chamber,congress,vote_type,voted_at,year&per_page=50&page="+x+"&apikey=06b0919993e0438a80c39d53cc99c878").body)["results"]

  votes.each do |vote|
    Vote.create!(bill_id: vote["bill_id"], chamber: vote["chamber"], roll_id: vote["roll_id"], result: vote["result"], vote_type: vote["vote_type"], congress: vote["congress"], voted_at: vote["voted_at"], year: vote["year"], voter_ids: vote["voter_ids"].to_json)
  end

  x = x.to_i
end

# x = 0
# while x < 39 do
#   x += 1
#   x = x.to_s
#
#   bills = JSON.parse(HTTParty.get("https://congress.api.sunlightfoundation.com/bills?congress=114&bill_type__in=s|hr&history.active=true&page="+x+"&per_page=50&apikey=06b0919993e0438a80c39d53cc99c878").body)["results"]
#
#   x = x.to_i
#
#   bills.each do |bill|
#     Bill.create!()
#   end
# end


# Legislator.destroy_all
#
# legislators = Legislator.create([
#   {name: "Dave", party: "Pirate", year_elected: 2015},
#   {name: "Chris", party: "Marvel", year_elected: 2000},
#   {name: "Big Mike", party: "Bowling", year_elected: 1632}
#   ])

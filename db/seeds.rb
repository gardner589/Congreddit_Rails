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

require('httparty')

def legislators
  JSON.parse(
  HTTParty.get(
  "https://congress.api.sunlightfoundation.com/legislators?apikey=06b0919993e0438a80c39d53cc99c878"
  ).body)["results"]
end

legislators.each do |legislator|
  Legislator.create!(name: legislator["first_name"], party: legislator["party"], year_elected: legislator["term_start"])
end

# Legislator.destroy_all
#
# legislators = Legislator.create([
#   {name: "Dave", party: "Pirate", year_elected: 2015},
#   {name: "Chris", party: "Marvel", year_elected: 2000},
#   {name: "Big Mike", party: "Bowling", year_elected: 1632}
#   ])

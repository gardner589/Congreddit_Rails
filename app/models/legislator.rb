class Legislator < ApplicationRecord
  has_many :legislator_comments

  has_many :votes
  has_many :bills, through: :votes
end

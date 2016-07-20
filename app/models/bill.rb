class Bill < ApplicationRecord
  has_many :bill_comments
  has_many :votes
  has_many :legislators, through: :votes
end

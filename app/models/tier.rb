class Tier < ApplicationRecord
  has_many :customers
  has_many :customer_tier_histories
end

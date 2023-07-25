class Customer < ApplicationRecord
  self.primary_key = 'customer_ref'

  belongs_to :tier
  has_many :customer_tier_histories, foreign_key: "customer_ref"
end

class CustomerTierHistory < ApplicationRecord
  belongs_to :customer, foreign_key: "customer_key"
  belongs_to :yearly_period
  belongs_to :tier
end

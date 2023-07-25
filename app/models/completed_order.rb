class CompletedOrder < ApplicationRecord
  belongs_to :customer, foreign_key: "customer_ref"
end

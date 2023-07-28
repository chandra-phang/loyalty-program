# frozen_string_literal: true

# == Schema Information
#
# Table name: customer_tier_histories
#
#  id           :bigint           not null, primary key
#  customer_ref :string
#  period_id    :integer
#  tier_id      :integer
#  spend_amount :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class CustomerTierHistory < ApplicationRecord
  belongs_to :customer, foreign_key: 'customer_ref'
  belongs_to :period
  belongs_to :tier
end

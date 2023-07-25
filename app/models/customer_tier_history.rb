# frozen_string_literal: true

# == Schema Information
#
# Table name: customer_tier_histories
#
#  id               :bigint           not null, primary key
#  customer_id      :integer
#  yearly_period_id :integer
#  tier_id          :integer
#  spend_amount     :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class CustomerTierHistory < ApplicationRecord
  belongs_to :customer, foreign_key: 'customer_key'
  belongs_to :yearly_period
  belongs_to :tier
end

# frozen_string_literal: true

# == Schema Information
#
# Table name: customers
#
#  id                       :bigint           not null
#  customer_ref             :string           primary key
#  name                     :string
#  tier_id                  :integer          not null
#  spend_amount             :float
#  next_period_spend_amount :float
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
class Customer < ApplicationRecord
  self.primary_key = 'customer_ref'

  belongs_to :tier
  has_many :customer_tier_histories, foreign_key: 'customer_ref'
  has_many :completed_orders, foreign_key: 'customer_ref'
end

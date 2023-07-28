# frozen_string_literal: true

# == Schema Information
#
# Table name: customers
#
#  id                               :bigint           not null
#  customer_ref                     :string           not null, primary key
#  name                             :string           not null
#  tier_id                          :integer          not null
#  spend_amount                     :float            default(0.0)
#  next_tier                        :string
#  amount_to_reach_next_tier        :float            default(0.0)
#  next_period_tier                 :string
#  amount_required_to_maintain_tier :float            default(0.0)
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#
class Customer < ApplicationRecord
  self.primary_key = 'customer_ref'

  paginates_per 10

  belongs_to :tier
  has_many :orders, foreign_key: 'customer_ref'
  has_many :customer_tier_histories, foreign_key: 'customer_ref'

  validates :customer_ref, :name, :tier_id, presence: true
  validates :customer_ref, uniqueness: true

  scope :recently_updated, -> { order(updated_at: :desc).limit(20) }

  def self.create_customer(customer_ref, name)
    create!(
      customer_ref: customer_ref,
      name: name,
      tier_id: Tier.default_tier.id
    )
  end

  def calculate_spend_amount_by_period(period)
    raise ActiveModel::StrictValidationFailed, 'Period is not found' unless period

    orders = self.orders.in_date_range(period.start_at, period.end_at)

    orders.sum(:total_in_cents) / 100
  end
end

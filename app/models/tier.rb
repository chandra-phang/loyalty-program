# frozen_string_literal: true

# == Schema Information
#
# Table name: tiers
#
#  id               :bigint           not null, primary key
#  name             :string
#  rank             :integer
#  bottom_threshold :float
#  upper_threshold  :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Tier < ApplicationRecord
  has_many :customers
  has_many :customer_tier_histories

  scope :by_spend_amount, ->(spend_amount) {
    where('bottom_threshold <= ? AND upper_threshold > ?', spend_amount, spend_amount)
  }

  def self.default_tier
    find_by!(rank: self.maximum(:rank))
  end

  def find_next_tier
    return nil if rank == 1

    # no need to use ! because it will return nil for highest tier
    find_by(rank: rank - 1)
  end

  def self.find_by_spend_amount(spend_amount)
    tiers = self.by_spend_amount(spend_amount)
    raise ActiveModel::StrictValidationFailed, 'Tier is not found' if tiers.empty?

    tiers.first
  end
end

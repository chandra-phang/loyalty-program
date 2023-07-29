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
FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    customer_ref { "C-#{Faker::Number.number(digits: 2)}" }
    tier_id { Tier.first.id }
  end
end

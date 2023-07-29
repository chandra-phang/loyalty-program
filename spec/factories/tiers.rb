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
FactoryBot.define do
  factory :tier do
    trait :gold do
      name { 'Gold' }
      rank { 1 }
      bottom_threshold { 500 }
      upper_threshold { 1_000_000 }
    end

    trait :silver do
      name { 'Silver' }
      rank { 2 }
      bottom_threshold { 100 }
      upper_threshold { 500 }
    end

    name { 'Bronze' }
    rank { 3 }
    bottom_threshold { 0 }
    upper_threshold { 100 }
  end
end

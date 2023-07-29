# frozen_string_literal: true

# == Schema Information
#
# Table name: periods
#
#  id         :bigint           not null, primary key
#  name       :string
#  year       :integer
#  start_at   :datetime
#  end_at     :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :period do
    name { Time.zone.now.year }
    year { Time.zone.now.year }
    start_at { Time.zone.now.beginning_of_year - 1.year }
    end_at { Time.zone.now.end_of_year }

    trait :next_period do
      name { Time.zone.now.year + 1 }
      year { Time.zone.now.year + 1 }
      start_at { Time.zone.now.beginning_of_year }
      end_at { Time.zone.now.end_of_year + 1.year }
    end
  end
end

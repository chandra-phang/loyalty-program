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

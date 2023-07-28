FactoryBot.define do
  factory :tier do
    trait :gold do
      name { 'Gold' }
      rank { 1 }
      bottom_threshold { 500 }
      upper_threshold { 1000_000 }
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

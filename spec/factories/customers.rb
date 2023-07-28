FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    customer_ref { 'C-' + Faker::Number.number(digits: 2).to_s }
    tier_id { Tier.first.id }
  end
end

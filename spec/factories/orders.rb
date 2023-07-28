FactoryBot.define do
  factory :order do
    order_ref { 'O-' + Faker::Number.number(digits: 2).to_s }
    total_in_cents { 2000 }
    date { Time.zone.now }
  end
end

# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  order_ref      :string           not null
#  customer_ref   :string           not null
#  total_in_cents :float
#  date           :datetime         not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
FactoryBot.define do
  factory :order do
    order_ref { "O-#{Faker::Number.number(digits: 2)}" }
    total_in_cents { 2000 }
    date { Time.zone.now }
  end
end

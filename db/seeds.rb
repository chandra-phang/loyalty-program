# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

TIERS = [
  { name: 'Gold', rank: 1, bottom_threshold: 500, upper_threshold: 999_999_999 },
  { name: 'Silver', rank: 2, bottom_threshold: 100, upper_threshold: 500 },
  { name: 'Bronze', rank: 3, bottom_threshold: 0, upper_threshold: 100 }
].freeze

PERIODS = [
  { name: 'Period 2022', year: 2022, start_at: '2021-01-01 00:00:00', end_at: '2022-12-31 23:59:59' },
  { name: 'Period 2023', year: 2023, start_at: '2022-01-01 00:00:00', end_at: '2023-12-31 23:59:59' },
  { name: 'Period 2024', year: 2024, start_at: '2023-01-01 00:00:00', end_at: '2024-12-31 23:59:59' },
  { name: 'Period 2025', year: 2025, start_at: '2024-01-01 00:00:00', end_at: '2025-12-31 23:59:59' }
].freeze

p "Seeding #{TIERS.count} tiers.."
TIERS.each do |params|
  Tier.where(params).first_or_create
end

p "Seeding #{PERIODS.count} periods.."
PERIODS.each do |params|
  Period.where(params).first_or_create
end

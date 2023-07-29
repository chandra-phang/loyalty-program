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
class Period < ApplicationRecord
  has_many :customer_tier_histories

  validates :name, :year, :start_at, :end_at, presence: true
  validates :year, uniqueness: true

  def self.current_period
    find_by!(year: Time.zone.now.year)
  end

  def next_period
    Period.find_by!(year: year + 1)
  end
end

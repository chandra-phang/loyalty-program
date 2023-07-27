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

  def self.current_period
    find_by!(year: Time.zone.now.year)
  end

  def self.next_period
    find_by!(year: Time.zone.now.year + 1)
  end
end

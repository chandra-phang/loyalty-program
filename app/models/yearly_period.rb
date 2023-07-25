# frozen_string_literal: true

# == Schema Information
#
# Table name: yearly_periods
#
#  id         :bigint           not null, primary key
#  name       :string
#  year       :integer
#  start_date :datetime
#  end_date   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class YearlyPeriod < ApplicationRecord
  has_many :customer_tier_histories
end

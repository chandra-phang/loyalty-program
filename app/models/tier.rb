# frozen_string_literal: true

# == Schema Information
#
# Table name: tiers
#
#  id               :bigint           not null, primary key
#  name             :string
#  rank             :integer
#  bottom_threshold :float
#  upper_threshold  :float
#  image_url        :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Tier < ApplicationRecord
  has_many :customers
  has_many :customer_tier_histories
end

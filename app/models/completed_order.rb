# frozen_string_literal: true

# == Schema Information
#
# Table name: completed_orders
#
#  id             :bigint           not null, primary key
#  order_ref      :string           not null
#  customer_ref   :string           not null
#  total_in_cents :float
#  date           :datetime         not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class CompletedOrder < ApplicationRecord
  belongs_to :customer, foreign_key: 'customer_ref'
end
